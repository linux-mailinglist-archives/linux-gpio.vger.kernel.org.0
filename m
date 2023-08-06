Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C0177142B
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Aug 2023 11:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjHFJ3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Aug 2023 05:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjHFJ3w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Aug 2023 05:29:52 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420931BEC
        for <linux-gpio@vger.kernel.org>; Sun,  6 Aug 2023 02:29:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-267ffa55791so1847076a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Aug 2023 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691314189; x=1691918989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCQ91v4bVLL2B5HVJi70nqrybilpQ/DULQO3PrQKDG8=;
        b=PSdEU1wUyUb6JnMPbhUpaiJTd+jujwcGeRWDSOI8HA/FeVpXOR9oVxWCbOX+3Y/Y0h
         rxCyoW96MgRP6Vr17mmp901dANvEI/YpU7EqwpbhxRNRZZiPYl//qtr4K9nKdcC4g1y3
         tVJXhUejtEx7+PiyaJJ2t6LTRsIZ6th0elw06qZtrYtMjzIzRq6sCQf6cDZUXKk4VXun
         6NlLd06nFaxIZ+KQnskQPufsRo7WTE5B57ObpNmG/Qxy3ebTcBAifFqtAof9pFLxgfzx
         T9+hzkNlcxZOmgSthRDa5hn/SCmsHbpz3UyVdYt7HhpxmuJwbeVb4NyWEy3Z2P5Dt0Q1
         Snyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691314189; x=1691918989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCQ91v4bVLL2B5HVJi70nqrybilpQ/DULQO3PrQKDG8=;
        b=e6tpLpvhi/Kk+gJqGnN6p8unKfyBZd0E+If2WBABhFxf/LvEbNluSb2JlYQt++7tI+
         u308fAHvpiIXLySh/PRhDcN2y1JwmMeUbTQ8QCDUE65hlSoLbq+4RtBjlxKjWexYr99G
         n58goTsiYtop0VJ8rMLhsQV83WirgjZY2XjA4dxPh6FGF3YZyM9ZNu6U++1TMTb5guGk
         A7Z1Zbu8iwU3uipgXnpch1rDEF5FNVQshlbbXtvEQIRJW49y1c0KwPb2MI0Tk4GoOlmx
         VVcOc2fAOYLl1dp/klsOEJOqvQ1nNj+D7Vib4/bEINMdS5MNYbSn1sH0dlg5J4Gap2NY
         DuAA==
X-Gm-Message-State: AOJu0YxxAyBMaFdMbWTf52MUvKpe7Qnt0TtfUheggCrPthJgpPaNOAvP
        lvqKS7Dxt9DsiHOlRuxU2Z8=
X-Google-Smtp-Source: AGHT+IGsQ/Ri/vmLbDKNOZGiHjs+AWik4yUAewTqzVyHnkP4Nvf278vx259c0O++v12a9yQAqJgbww==
X-Received: by 2002:a17:90a:4966:b0:263:68b0:8ca5 with SMTP id c93-20020a17090a496600b0026368b08ca5mr4960942pjh.43.1691314188896;
        Sun, 06 Aug 2023 02:29:48 -0700 (PDT)
Received: from sol ([220.235.36.234])
        by smtp.gmail.com with ESMTPSA id m9-20020a17090a7f8900b0026333ad02c1sm4081895pjl.10.2023.08.06.02.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 02:29:48 -0700 (PDT)
Date:   Sun, 6 Aug 2023 17:29:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZM9oB0l4fvOinzLm@sol>
References: <ZMLZSqRwrPfKEbX3@sol>
 <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
 <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol>
 <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol>
 <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol>
 <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 06, 2023 at 10:13:38AM +0100, andy pugh wrote:
> On Sun, 6 Aug 2023 at 02:02, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > And I maintain that the wrong path here is to use v1, rather than v2.
> > So v2 is absolutely not an option?
> 
> Not unless it is available as an automatically installable dependency
> of our package, no.
> Which effectively means that it needs to be a package included in
> current Debian.
> 

You can't statically link libgpiod until it is available as a package?

Cheers,
Kent.
