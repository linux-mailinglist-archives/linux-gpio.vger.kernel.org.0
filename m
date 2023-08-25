Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CC3788FB5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 22:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjHYUTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 16:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjHYUTG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 16:19:06 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8E7171A
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 13:19:05 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-44d4d997dcfso618903137.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692994744; x=1693599544;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Lgfl+sBrI7iGkdGMvxvYsN+wTvmFwozsU3ZwujNh7g=;
        b=WgHEY4fx1GfMBmktefs4eR0VpBBN+P84BxZ9qWN3khf42dVJD+NthQM/Ya646MN2cs
         8Kmpf+GFP126yYFtK86A9+fj9I3HpDNOK4/cT9bH9Nzjzk7WrwbyOlCk5BppMavQIsAF
         esHk96wOO51yztQk1y793Ue+TDmBx2WAY8rZ9m+8sDEF9etLI58VV1S5qKY4X5TwabCz
         fmvJCNtNN8nEpyRWVU8KxShcpvTNVQzM/BgQmta0xG1XaWEPoNprVjjd1nNQCyGJCqr6
         aKUUvNFhjxwe3CwrHZCSozs+iUBDLREHegRXlp73dgirlx5gs5R2AaQnt7hl2J4+BN2L
         8YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692994744; x=1693599544;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Lgfl+sBrI7iGkdGMvxvYsN+wTvmFwozsU3ZwujNh7g=;
        b=TwH5wMpJXuCweXb7Nhr/J5TTB+YK8mWzeZlIKiqTXGrCjyueWq1hUomnheNkQFX+Na
         +nZc4wKJurD6We8+6NlSAbXlKC7BpLTIMBfyNiLgPZBVP57c6uMSWbdw/5VA3gtS4asL
         wBQvoYyeqp8sxQSklCPtSB4lM6c1TT7DkB7i7jZNNO6DioVk9ts34dSkloKkvvPbkWeY
         75vmLVGzyyd3ugKXLAb7tBSZ2JE22bJdNofks6XxNgwpcy7AJ8ogQQ5/vtncdszgMOlB
         LvqKeOnhTRI94/2bv+Ie3h7L7js8ryWZKqYLssHKfSRKeer2P7N/ExEDrI4JgT6dtVIA
         FvtQ==
X-Gm-Message-State: AOJu0YxlxhupKEMrpQqk0h3L7txiCE7H4kKujLc1aRBt8St+v0AXWE+t
        pvIKvnYL/SVrd+MvveWK586saWL5NKLVaiJ7Lah/VUy5no1Xuq1SOxw=
X-Google-Smtp-Source: AGHT+IEFgDgxT2uIq35FNml4FxDBUCOnCLPLz0r5uLmXn0E3wjeED0Du5LpSDSMy3w6jzZHkFFYgGJ9daS2esVpcun0=
X-Received: by 2002:a05:6102:3655:b0:44e:906d:58b with SMTP id
 s21-20020a056102365500b0044e906d058bmr7433384vsu.14.1692994744314; Fri, 25
 Aug 2023 13:19:04 -0700 (PDT)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 25 Aug 2023 22:18:53 +0200
Message-ID: <CAMRc=MdBBhczdoS97FhdYWVjh+VnzW5CAcEjeDuDOAvzPQ=TqA@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.0.2 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I've just tagged and uploaded a new bugfix release for libgpiod v2.0.
It fixes a couple
crashes and minor bugs in tests. Details can be found in NEWS and the tarball
and git tag in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
