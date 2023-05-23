Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF7470DEE0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 16:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbjEWOMv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 10:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbjEWOMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 10:12:30 -0400
X-Greylist: delayed 912 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 May 2023 07:12:09 PDT
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580041B0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=dkYJba+AXM4+x3yqDtP9Tzku4Y7BzNxzUrtbaTgPEc4=; b=VW+y0QhU6WT4wsaM7V02Qgzj5z
        g0gd7l9FFXCTa8r8FgakXMOv17iY7LwaeD/5pz8i6UCvmi+GD2qBKyZmSWzLwfovP0Nr9/hAp3iMr
        YG4zo9C7oSdFtUxOC5a68sg4zEbj6QuMjbFrKbQcNrbLC0qP3nkw8TVzxYSKpAycggQlk61NEyd4v
        RIwvVOC8T9xZoC95HK0zxieLmQ/DuiyKC6Pag/+uNdCxots8eX/CNkoV53ij+D/MVSYX90pc7uCzi
        QN/2c76mHLC1RGGrH3alH1iwCQLJFDOS7ZzX5zP0h0U01DAxsVH71VeVHU/GUxInR1Fmx7YWd6gdB
        9bpVuBzg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <esben@geanix.com>)
        id 1q1SUj-000DUl-Fh
        for linux-gpio@vger.kernel.org; Tue, 23 May 2023 15:56:09 +0200
Received: from [80.62.117.0] (helo=localhost)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <esben@geanix.com>)
        id 1q1SUj-000OiR-Ad
        for linux-gpio@vger.kernel.org; Tue, 23 May 2023 15:56:09 +0200
From:   Esben Haabendal <esben@geanix.com>
To:     linux-gpio@vger.kernel.org
Subject: [RFC PATCH] gpioset: only print prompt when stdout is tty
Date:   Tue, 23 May 2023 15:54:41 +0200
Message-Id: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26916/Tue May 23 09:22:39 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When gpioset interactive mode is used as intended, as a human controlled
interface, stdout should be a tty.

By leaving out the prompt when stdout is not a tty, gpioset interactive mode can
be used as a really simple deamon for controlling GPIOs by connecting it to a
FIFO.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 tools/gpioset.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index 9dc5aeb8b286..a1ca211febd7 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -742,13 +742,12 @@ static void interact(struct gpiod_line_request **requests,
 {
 	int num_words, num_lines, max_words, period_us, i;
 	char *line, **words, *line_buf;
-	bool done, stdout_is_tty;
+	bool done;
 
 	stifle_history(20);
 	rl_attempted_completion_function = tab_completion;
 	rl_basic_word_break_characters = " =\"";
 	completion_context = resolver;
-	stdout_is_tty = isatty(1);
 
 	max_words = resolver->num_lines + 1;
 	words = calloc(max_words, sizeof(*words));
@@ -757,12 +756,9 @@ static void interact(struct gpiod_line_request **requests,
 
 	for (done = false; !done;) {
 		/*
-		 * manually print the prompt, as libedit doesn't if stdout
-		 * is not a tty.  And fflush to ensure the prompt and any
-		 * output buffered from the previous command is sent.
+		 * fflush to ensure the prompt and any output buffered from the
+		 * previous command is sent.
 		 */
-		if (!stdout_is_tty)
-			printf(PROMPT);
 		fflush(stdout);
 
 		line = readline(PROMPT);
-- 
2.40.1

