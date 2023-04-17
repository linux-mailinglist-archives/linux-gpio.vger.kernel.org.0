Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD5F6E4B3C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Apr 2023 16:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjDQORd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Apr 2023 10:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjDQORY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Apr 2023 10:17:24 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AF4B77C
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 07:17:11 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id h24-20020a17090a9c1800b002404be7920aso26264398pjp.5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681741030; x=1684333030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUkDbFwjR4C4eOTtOz2zCMHhrw2XGgkE7yEbTUj5Ees=;
        b=qx87YpHYYm0V9jmbjiWl53K/L6tGQl39P9WsVPjOqoOwiTdj6OlbVgRvkp6nLJhBmO
         NieMr8rVhsbzJqldtmjZSp2HU1azuo0VplVw0Yi5KUaI3o8TL+RDjUVVPN9I9c3rjC0f
         KbCGqJEHudhXCtJ2eYWLNpQ5BdFc0c3NsRJHb5OhwFwXRGk7mH90mG3sF/bivblxShe9
         BWEDUETLFewDVwxDymIzhG1+8yDqZ3dvOP0f030ogvIXMNyObXkGqIGiS0jmvfKo/Z09
         yft7lmN2zBEobIX5jhy7SDJwVCDOP6nzJm0IbOkrAVW45R3jCOOW34e4/MVuWwLQnehf
         rAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681741030; x=1684333030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUkDbFwjR4C4eOTtOz2zCMHhrw2XGgkE7yEbTUj5Ees=;
        b=GGl53Gn6bYN2v8N0iTEXVAN4yjFduqrfEaX//p2CHYP24kLJWVdaKsHtKMs94mrIFV
         o0HFgfMzQvrx7YFc+63NBfBSz0bbNxzFJrNrJsSjLHdv7JlX1eAA/4rLo5w0qjK1tRNY
         bxdnWNLGGKF5P0ZM+uEDrBCVb2UsTioGDU5+QIyOIBpyZm8g/IaakaEahpaNbbgeBTJg
         uX71P0zuFuXm+Ll9gpE3ObWtVOof4H3DwTav/srZXHx5xQYeg8CjEidxuOK+nlWdeWra
         NM8XePVhbk9lL6bbXuuMrdUQmwOAWUlFKcFnxRAgo6PZttiA1zRxdQ1vjsL5Yw7lYoIL
         H+gQ==
X-Gm-Message-State: AAQBX9dvfwqdS339CplKXYoMjpR2wmbC517NvVxYpnBYUd10Yo7rHmzI
        bshjMLjMv+864KFiN2EhhJ0=
X-Google-Smtp-Source: AKy350aleb2ZySuY3v0SkB2oE6NGhr5VzoOFc8Q9JEuORgSvG2MWq06Ar5kxCJUH1eDPYHuhL/bv0Q==
X-Received: by 2002:a17:903:32ce:b0:1a6:b78e:de0f with SMTP id i14-20020a17090332ce00b001a6b78ede0fmr9778552plr.51.1681741030544;
        Mon, 17 Apr 2023 07:17:10 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902ab8900b001a1abc93eabsm7701123plr.226.2023.04.17.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:17:10 -0700 (PDT)
Date:   Mon, 17 Apr 2023 22:17:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Sameh Mohamed <sameh4@gmx.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Question regarding locks / race conditions
Message-ID: <ZD1U4lu12W4GKRPN@sol>
References: <CABrMOxZY6Q3wiYsJUaXZiSET_gjMJ3GWaMrDCXwXC6nf7AX2_g@mail.gmail.com>
 <CACMJSevuPg=bWkE5fTdechJMrTUWiaM9nn1f8G1tTDdphcPWFQ@mail.gmail.com>
 <ZD07jv32RzLXKGfE@sol>
 <CABrMOxbWa8mxA=ckAu6QVKnej5o7UGrWXdeDMaAqScGVVk3=wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABrMOxbWa8mxA=ckAu6QVKnej5o7UGrWXdeDMaAqScGVVk3=wA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 17, 2023 at 10:13:18AM -0400, Sameh Mohamed wrote:
> Thanks Kent and Bartosz,
> 
> @Kent: you are correct, I don't intend to share any line requests on the
> same line, rather I am curious what will happen if two threads create two
> requests for two lines at the same time.  For instance two threads setting
> values on different GPIO pins but at the same time.
> 

No locks necessary - the kernel will deal with any resource contention
internally.

Cheers,
Kent.

