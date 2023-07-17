Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C177561EA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jul 2023 13:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjGQLrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jul 2023 07:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGQLrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2023 07:47:40 -0400
X-Greylist: delayed 336 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Jul 2023 04:47:05 PDT
Received: from mail.dnmx.org (212-8-242-149.hosted-by-worldstream.net [212.8.242.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184581704
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2023 04:47:04 -0700 (PDT)
Received: from hxuzjtocnzvv5g2rtg2bhwkcbupmk7rclb6lly3fo4tvqkk5oyrv3nid.onion (localhost [127.0.0.1])
        by mail.dnmx.org (Postfix) with ESMTPA id 2BDE6B88F36;
        Mon, 17 Jul 2023 07:41:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dnmx.org; s=mail;
        t=1689594086; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=4PT/PCl7Z/Qj+wuPD05PLS+T3bqvvC53F92k2epcqrM=;
        b=gg6peWJLikxWa/GxWFyl59m/tyghrGQgP77G03aGEW0IjMN3XpwpsVfK1hjVtpxcNgjJJy
        viOvlmUKRnIFOGMbYxF0mzq0Ac8Zt4Z7R5FaSF8Hx6Vb0xcS7KVHlRQw8+CWa9zJnxh4da
        tcDECbEfj/kOae3FtJ1Iz9iIKRXgPkfreK5AMG8LsDWUM1mTQSYZMKuOzBJ5whapGKiw/s
        MLh8j41nJFh0XNSme9LAU6bX7+8kvn/NkYLgnZ4PhMjqICd8g5oVS2KW+HkzAwWBNYx63L
        NAUFPNfLgCNMUGLXcttgd1l7TW6jevRw3eC5qAnvigACueXJOnYW60qKSdfl8g==
Received: from 127.0.0.1
        (SquirrelMail authenticated user rileyan@dnmx.org)
        by hxuzjtocnzvv5g2rtg2bhwkcbupmk7rclb6lly3fo4tvqkk5oyrv3nid.onion
 with HTTP;
        Mon, 17 Jul 2023 06:41:26 -0500
Message-ID: <817b30e1a76845043f97f72f3f14b389.squirrel@hxuzjtocnzvv5g2rtg2bhwkcbupmk7rclb6lly3fo4tvqkk5oyrv3nid.onion>
Date:   Mon, 17 Jul 2023 06:41:26 -0500
Subject: New email
From:   "LENOCOIN" <rileyan@dnmx.org>
Reply-To: potterjrcarlleroy@gmail.com
User-Agent: SquirrelMail/1.4.22
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        MISSING_HEADERS,RCVD_IN_DNSWL_BLOCKED,RDNS_DYNAMIC,
        REPLYTO_WITHOUT_TO_CC,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [212.8.242.149 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.0 MISSING_HEADERS Missing To: header
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  1.6 REPLYTO_WITHOUT_TO_CC No description available.
        *  1.0 RDNS_DYNAMIC Delivered to internal network by host with
        *      dynamic-looking rDNS
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org




Mr. Carl Leroy Potter ADMINISTRATOR OF THE LENOCOIN INVESTMENT PLATFORM.
LenoCoin is a cryptocurrency investment company, solely saddled with the
responsibility of helping investors get extra value on their bitcoin
investments. It was built to help users to invest in cryptocurrencies
easily and earn stable interest rates after investment. Bitcoin continues
to be one of the best performing assets of 2023/future and there is never
a dull moment. Can I enlighten you more about this LenoCoin Investment
Platform and how you can benefit from it if you don't mind?

