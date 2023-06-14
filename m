Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A1C72FFDA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 15:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239341AbjFNNVp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 09:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234810AbjFNNVo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 09:21:44 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A72B8
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:21:43 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b3d29cfb17so26679745ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686748903; x=1689340903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gK4t50LQTbWNMb2pw8qv8TWIMfzfgP03YEPKqXeJkjU=;
        b=nozM25XMaacCWyjkJ3ztDi8jkjq7u3yWWYo6PNTffB4junwGzH5L5lnpVg57nEC5Ux
         eIJ/hYpRJUq9pvTMn2nkC+Navd2RB9xXj0qh6MdlHCRAravYiEHTLm/MiM415K5Im24C
         d+WSwhnllJfTt1cXLCEzyVzgXrI5p2C7pD/EAOFEZXZuoAyu4IkIsj8mrv2UKCW9LbFu
         96pSrIXDcMV9g8mFhTgmXEhCthUk6Dlwx3fapGuSzfWvCkseAGPkGNci75Uedm3qA6sU
         PsewOCB3RVGeHyDzX/yVE4Casqogpg3GeiYSLxpbwHQdpKxO6034Bwx66MWIteRQYmk7
         FUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748903; x=1689340903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK4t50LQTbWNMb2pw8qv8TWIMfzfgP03YEPKqXeJkjU=;
        b=VFW5hjiYQBnkMX93AI0B0wLo62kU7ZS8+mQDMqQpkDomgAwJR4y0mJHZEljEt5B2K2
         MDe3YNbY0oBSfF6ToyzpfAngm5LQtfC1QgeRZHdz79m2ECpjz29SMZsNvHSFwNL5LCcf
         HSJZwifwkKxZqak9iE9IKiwkf7+AbR+gCW2HPyyi64e92ts5EEQfcr01weqluRnQGgbu
         7d6Eb6wJ2w1Mqz+QnLb/Si93+ASZBAXbwf60c5p+yh3J+sK93yw7COI2sg/NduMuGUSX
         qyKXSo5qiJqhJFqSxY2gZd8YAWwQE4VCKZqmGppBJ3cZZYPqA4cCTxOz2NGvyNaXYlRh
         K78Q==
X-Gm-Message-State: AC+VfDyqcfpI79G3PBiZhR1At3PHHfcK0vCwLt9nRMBE5q+Fj2niK4HR
        gzcroUP81OBxQ/FBtQJrrh7BvHgN79c=
X-Google-Smtp-Source: ACHHUZ5u720ru9l8NS1Ujzt5Y7JX0Fw8s7Yp12wkyz1DRez0HDtjER7kmsoiWf29Qfi/0D9KgnmufA==
X-Received: by 2002:a17:902:7281:b0:1b2:1a79:9a67 with SMTP id d1-20020a170902728100b001b21a799a67mr11696353pll.50.1686748903308;
        Wed, 14 Jun 2023 06:21:43 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902968300b001b0266579ebsm12121656plp.194.2023.06.14.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:21:42 -0700 (PDT)
Date:   Wed, 14 Jun 2023 21:21:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
Message-ID: <ZIm+4qmSUgFrVzLc@sol>
References: <20230614035426.15097-1-warthog618@gmail.com>
 <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 03:03:51PM +0200, Bartosz Golaszewski wrote:
> >
> 
> Great idea! I applied patches 1-3 with some tweaks (coding style, C++
> comments, statify functions, put local functions into anonymous
> namespaces for C++, apply black to python code etc. etc.).
> 

Ok.  Would've been nice to get review comments before having changes
pulled straight in, but whatever.

Requiring C style comments in C++ is just weird.

> You can respin the rust patch separately.
> 

And what would you like respun there?

Cheers,
Kent.
