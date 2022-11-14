Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51E6628B31
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 22:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237477AbiKNVQ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 16:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237071AbiKNVQ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 16:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB282664
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 13:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668460529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xhFKsQdnuFAVM9AV+tj1zSx92ABSp3wva+haXFolNdk=;
        b=VH/omCNTT2WWG3GVrHwN2MRqgyzJRNseL0n0Et/GMCVvd+wMkhs0HHevtJpubQKdteyNp2
        7WTTvw0eDvKFwuX/Ep0T/vRHZ7Vo33tRThGKEzWlFCZ5xLL1xUJRUrbESrwr4xxWhEb/fJ
        Z8vK5L0Seo96IgmSI9gKxrVv0PffWnY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-JIffme_nO-yvgTgy38XztQ-1; Mon, 14 Nov 2022 16:15:27 -0500
X-MC-Unique: JIffme_nO-yvgTgy38XztQ-1
Received: by mail-qt1-f197.google.com with SMTP id gc12-20020a05622a59cc00b003a5444280e1so8906933qtb.13
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 13:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhFKsQdnuFAVM9AV+tj1zSx92ABSp3wva+haXFolNdk=;
        b=pjWwnPOEubYctnmcVszEqhpn/8mLizA0xXxg/kXrHrYEgd7tEtc8+T1B7AY97Dp2s7
         vv3WjQuv9kL+m7IM8tsyfLPMl/Vhdn1+oO/N6Zmj+KDvC9Y1MnCBxgP9/9aws/tmmUTP
         zy86saNiiWW9tw+D+xpCN/YJF0ACEY9M/kQpoKlZJ8LfYb2ReLHEHndI7Jfm6z3z2cBm
         OkP4ZN2YXRRbRpmjr2N4uOapmrE01zv37fAXjElWKdN24a9uoR+2pRVQ7LW9bT1W12Fw
         YnfoQt8LboZghdDcaXfK2hdRLUrV3DmrQNaHajAFAPdhxXEipBhl226TuzlpZTZnNXyf
         880w==
X-Gm-Message-State: ANoB5pl5m6gbuMVePPaH7riHxHVGgB03jfj9vxcGLueEBShNPOQH1DFi
        xn1MfPNdzPTIpAGgl0tu6bfLeAlbBPwIe6KVjvPmG+KBER6dpyyi2J1CLlniVrgxNN41dnjvbgE
        AVrEM8KNkWtnKOZ2disONxw==
X-Received: by 2002:a37:7d8:0:b0:6ce:4418:16d6 with SMTP id 207-20020a3707d8000000b006ce441816d6mr12662813qkh.138.1668460526596;
        Mon, 14 Nov 2022 13:15:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4mG+Q84LW9nFJZrr65rugoziYiZImLqxLy1XSu8SHxKguFF1ZY+pQanMGDAPaMhpwD/6he+A==
X-Received: by 2002:a37:7d8:0:b0:6ce:4418:16d6 with SMTP id 207-20020a3707d8000000b006ce441816d6mr12662797qkh.138.1668460526382;
        Mon, 14 Nov 2022 13:15:26 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id h21-20020ac85155000000b003a50248b89esm6183769qtn.26.2022.11.14.13.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 13:15:26 -0800 (PST)
Date:   Mon, 14 Nov 2022 16:15:25 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpiolib: of: Use correct fwnode for DT-probed chips
Message-ID: <Y3Kv7XoBytwwy9pC@x1>
References: <20221111113732.461881-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111113732.461881-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 11, 2022 at 12:37:32PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The OF node store in chip->fwnode is used to explicitly override the FW
> node for a GPIO chip. For chips that use the default FW node (i.e. that
> of their parent device), this will be NULL and cause the chip not to be
> fully registered.
> 
> Instead, use the GPIO device's FW node, which is set to either the node
> of the parent device or the explicit override in chip->fwnode.
> 
> Fixes: 8afe82550240 ("gpiolib: of: Prepare of_gpiochip_add() / of_gpiochip_remove() for fwnode")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>
Tested-by: Brian Masney <bmasney@redhat.com>

I separately sent a similar type of patch to fix the same issue today:
https://lore.kernel.org/linux-arm-msm/20221114202943.2389489-1-bmasney@redhat.com/T/#u

I'm still not sure what caused this breakage in linux-next.

Brian

