Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12120666306
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jan 2023 19:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238714AbjAKStO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 13:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238273AbjAKStH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 13:49:07 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A513D5CF;
        Wed, 11 Jan 2023 10:49:06 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id cx21-20020a17090afd9500b00228f2ecc6dbso735851pjb.0;
        Wed, 11 Jan 2023 10:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQpX2pCKEZB/TV6PO+DqrOS3yGt33Jv2hfgaqn9dHgM=;
        b=SWR+b0ckKOBEn0+JPmt7wsGK9bSIVtz7DkHs3Ksf9sbr0OgSyQHzGSbKFJH2inSOPb
         C+7+ljdPvaP3J3k7/1xHq2UH6hpMTHhoNT2csYdW3IcpWyMHehs+WCYrk7QNE0K8WVFB
         KMnb8V18wUX86LVrScigiNM91fkYZE7wcKu1yf9nrfkgTasj27NsVD52+XldFMTxgZSP
         yA94LtONPVmdHjlJ+1T8lsWLDd3mLwis8jkxymKQvSYz9kjfnZiafJB1ph9aBlHVoYQj
         QitvZMZ7GQVTozUFcu/2TGVX6YdMbmGxfEtJiqtwDrKkia/nt/sAqQdnjJR0vvEtaSjY
         wfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQpX2pCKEZB/TV6PO+DqrOS3yGt33Jv2hfgaqn9dHgM=;
        b=pcvymsoWK7WdGLqBZZhKgHwcdBKRa4ENly4DcuGDTcOoAeAfqHDMBRxsNt33Mg/rck
         nO7Wx3QE//4Lx0TIEnaBtXDMzEQSppmRaap1Pc37nnvdrxSp3PTIUwDkmXPZtPyRwECx
         0UEOhes6VXyEKtCKUWHlhwaTv3IdnAhIGBsirNaHyybCfy1R/+YhkcFskZ8gjt+1QPfA
         jfqrlDF/IZVUMrpfDL0U27EVqap/Pe0veu/JkjXwMewvVsrwp5XiSNf0L7TzHSxhEjho
         P1z0cvAeMJa536nsMBVYmafbnPOziiORssFF2gr5ubE9w6+SYr5DQAyFgPpCBKIBTyfb
         Kpjg==
X-Gm-Message-State: AFqh2kpvwHS4zLvkBovET65+sdbohpkXfXif0N47/TjwqPyIDdZbq2L0
        coRTDyQzfRt3tJH0pLiH46o=
X-Google-Smtp-Source: AMrXdXuRpKQAEoQjHbdABLMNcPK8rFSgVjOVM/PXcBXcuHKH0MAO24etOCIgJKHvypcJCK46oeolcQ==
X-Received: by 2002:a17:903:181:b0:193:3154:5c86 with SMTP id z1-20020a170903018100b0019331545c86mr16645310plg.21.1673462945217;
        Wed, 11 Jan 2023 10:49:05 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3f43:2598:9756:e3b])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b00186748fe6ccsm10470216plb.214.2023.01.11.10.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 10:49:04 -0800 (PST)
Date:   Wed, 11 Jan 2023 10:49:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] media: em28xx: Drop abuse of gpiolib
Message-ID: <Y78EnUP1zCLVAR5k@google.com>
References: <20230111135801.135824-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111135801.135824-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Jan 11, 2023 at 02:58:01PM +0100, Linus Walleij wrote:
> The driver is issueing calls to the legacy gpio API from
> <linux/gpio.h> to pull a LNA gpio line low or high.
> 
> The code as it stands can not work and does not make sense
> since the GPIO number assigned to dvb->lna_gpio is only
> in scope in this file and never assigned any valid GPIO
> number, the driver has no way of asking for a proper GPIO
> and will likely ask for GPIO 0, which will likely be wrong.
> 
> In one execution path dvb->lna_gpio is assigned some constants
> to the local GPIO block which is not using gpiolib, adding
> to the confusion.

The dvb->lna_gpio gets reassigned in the call to

	dvb->fe[0] = dvb_attach(cxd2820r_attach, ...);

which calls cxd2820r_attach() which ends up calling cxd2820r_probe()
which creates a gpiochip and passes back the first gpio number. It all
seems very fragile and will break if dependencies are not linked "just
right" and I have no idea if this all still actually works...

Thanks.

-- 
Dmitry
