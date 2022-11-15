Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517F5629DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 16:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiKOPoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 10:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237946AbiKOPoK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 10:44:10 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79940E00F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 07:44:08 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id k4so9704506qkj.8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vdU0l5q7SwDqyQdrl+AlHir8nP1WSQabvgknUb9WZQA=;
        b=m92bfgcFt3yNBIX01yMvlIwkrK025eXWJmxCKJUgOZfnvw0moqbnNQd4rT1u7M+g7c
         +3i3SGLIlH3x/wr2DmQPnJv3F8ziv8ZC9tmOYkFMUCUqQ+Sb2Vnf6ccwoeA4H+/zXz/0
         i2g7ngZpHgA7kO/3dY12V7FJiHHNgeUOEaRpUCbd5C3GshTS41ckGCnHMCxqdC1g9ZtR
         mhKMjfyiwxJcJTshLMkLWIZiS6XLpAAHk5IITdT4yvq3B9ZL+rO/AQwd1skXbUdtF9YU
         B8h/Kjk21ZC7HuTpL4k8NQul/2ijjp+BTYg4z9Ji9nAUzizeLsVeiPxag4HeYvobgMxv
         lksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdU0l5q7SwDqyQdrl+AlHir8nP1WSQabvgknUb9WZQA=;
        b=21q0n6aJ6IbIsbq9v7TO1dC/Q3RoG37SIjefIsfHZn2rWnumetuK7p4Nppjc2oIHvQ
         WJgAQlcHhkBtpsT8oT+T5fjJQfaXLF7y+BKLYkioUO7o2KO6xKaG+tRpuTix+g6bXke0
         RB9tpjmp1vgd3m0OeUnbWXk5keKZa5sC8HWSo2JwT+6LkP7f4l+Iuy7VzabCoqxDKQC/
         cmnI3DF9qocYiFJBUO4XvgA6AkiAY1V5C974F/eLmJtQYSV4zgiuyRizvOkCQP0UN95V
         5HBHrmafVWHQMaO7P6AWdSlh65b76XEZ3fFc1p1yMdnDzQe24qznS1eHoi3gdYRfpx5o
         Eccw==
X-Gm-Message-State: ANoB5pkUrzm5DecThutGpuo7ViGxrPkfte+5o4FzR4FR51iMt2YeKkLD
        jeeQKgk5iv9Nth1R/tsKIh32GQC8ZO0L3KlvT9s=
X-Google-Smtp-Source: AA0mqf5ApPNVXJyRpZv0hHxNTxwfg+sCTuDPOVu5KsV1iXmNCCJ4YYsnzJrt/oguuJk+Zr0GQ92bKllx4nYhT+cSZ+k=
X-Received: by 2002:ae9:f409:0:b0:6ed:6cd7:606c with SMTP id
 y9-20020ae9f409000000b006ed6cd7606cmr15445784qkl.182.1668527047693; Tue, 15
 Nov 2022 07:44:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac8:5dc6:0:b0:3a5:3e54:67d with HTTP; Tue, 15 Nov 2022
 07:44:07 -0800 (PST)
From:   Amisha Hema <amishahema19@gmail.com>
Date:   Tue, 15 Nov 2022 16:44:07 +0100
Message-ID: <CAGM-QZ1e+Nx2x9ajF7yjjrDNj91C-i5MrAYzUSqAu0qLB_L+=A@mail.gmail.com>
Subject: Re: new message
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Did you receive my mail yesterday?
