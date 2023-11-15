Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 835F97E23E5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 14:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjKFNP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 08:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjKFNPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 08:15:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B36310B
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 05:15:53 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F4DC433C7;
        Mon,  6 Nov 2023 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699276552;
        bh=gB6dHbd+2AiNjLc0Xengz1s6Ni/v8niL9A+T/+ECNNk=;
        h=Date:From:To:Subject:From;
        b=qiJJF7pG1tqcF4zfrhFlo1VC4zRXBa5vYJqRXjiDLXByT7XWooG59RzDwixUkrr1l
         Tjkf6vKi0nf/fNjVbQyqbu5ZnP3YMvvpVpRGil1GlO0S2bL5ZS7HXp6XPY4KHGoxw+
         f4Cg/kkGLdNwJeg9ZsH9B/RglWVAfBdZXdiNIAt4=
Date:   Mon, 6 Nov 2023 08:15:51 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-gpio@vger.kernel.org
Subject: PSA: migrating linux-gpio to new vger infrastructure
Message-ID: <20231106-loyal-curly-boar-4cbaf4@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Good day!

I plan to migrate the linux-gpio@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
