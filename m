Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22BD462E069
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 16:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239739AbiKQPzz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 10:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbiKQPzy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 10:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC3E769D1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 07:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668700494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bRgEstsiaza00mxfx8Zw8rQJ2a50YhYzkAACPA1ZNfM=;
        b=SsXXiZrFbAr+sV+LsUEbjO3naCtwXu72k36KDJjmmc9Z9X1Iu++t6QiILP0Fji2RBzcf0g
        4cKMbQ/8tYhEcz9o8nec8LV4uHKYIIJ+HAnjO2jaXj2DuAjTC5ifnSFlMvTUpV9ijntoEd
        DCRv9IgunE4nPAAzRgi8npmQ6dSGa4A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-cvLS_aQ8PDesPVAnbMrycA-1; Thu, 17 Nov 2022 10:54:52 -0500
X-MC-Unique: cvLS_aQ8PDesPVAnbMrycA-1
Received: by mail-qk1-f197.google.com with SMTP id w4-20020a05620a444400b006fa24b2f394so2538049qkp.15
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 07:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRgEstsiaza00mxfx8Zw8rQJ2a50YhYzkAACPA1ZNfM=;
        b=7FEqCL9MDiskCaW3UyS7M2qZ0QfKRHZ0uy47FMtGmHTjq0ZvhbKF9eTt0zmVEg3KL7
         F+bPHWwp/n+Y9h8wTaUhcvSsSj3k1p3EhSqke3o5EAi/56l2osTvf7bdR3YxS2Zkoyt9
         nZgTynmCwpZUxurCwWJInIwN6S1KEpLMmB6kp4ANb3Jj9gw877kb+3s7kciIWf0UwDJ2
         XIREh0Q4uPQDUT1Yh0v3nv4DG4ynNd74K3MYtA7+fcxKuxVacs2GgObhc+YMHt+9elkj
         22eM4ulQ3mmSvQrG/5JdretVTOEZWVtUkhsK8n8eZHoTZzTbWXv+8Bj4EStzz3av5CHB
         Y9Zg==
X-Gm-Message-State: ANoB5pkCE5Dz5SAPHeAtL49VQUenAlWOq3xUm5GS3p0rN3wYby9oRTiR
        rpq1WZbZqnBk1JwkLqDEC6ef1SSeaskHz98sb272WXewe/5MDcqIdOguINV6n+qgikxkH1WcN8v
        bj1L0LIQdfiLodPc2keo1vw==
X-Received: by 2002:ac8:5299:0:b0:3a5:3623:17b2 with SMTP id s25-20020ac85299000000b003a5362317b2mr2724072qtn.543.1668700492288;
        Thu, 17 Nov 2022 07:54:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4xz3uBUV6IVgVCKdytOyvXVviItTtAVxx7J+xEH7uoA8FGlQTKyqHopJRsvmbveNc+qoxBpg==
X-Received: by 2002:ac8:5299:0:b0:3a5:3623:17b2 with SMTP id s25-20020ac85299000000b003a5362317b2mr2724056qtn.543.1668700492084;
        Thu, 17 Nov 2022 07:54:52 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id 2-20020ac85642000000b003a5612c3f28sm548302qtt.56.2022.11.17.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:54:51 -0800 (PST)
Date:   Thu, 17 Nov 2022 10:54:51 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Unify access to the device properties
Message-ID: <Y3ZZS+/QKXtRKH9B@x1>
References: <20221116141728.72491-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116141728.72491-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 04:17:28PM +0200, Andy Shevchenko wrote:
> Some of the functions are using struct fwnode_handle, some struct device
> pointer. In the GPIO library the firmware node of the GPIO device is the
> same as GPIO node of the GPIO chip. Due to this fact we may use former
> to access properties everywhere in the code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

