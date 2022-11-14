Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A03628B35
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 22:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237499AbiKNVRN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 16:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbiKNVRL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 16:17:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29D0BE3F
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668460573;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pPyHbVIhVXxAvPHXANuB0471/7HtR2HBTgw/R/uDUnU=;
        b=XY+sDLh9sb5abN/MtzAvE4nXgk0dxmUDBol5Lf7CdN/i2pxWdwna15arFh5pY1D9/M8+bJ
        OKWOjw7Iva1ozi/uFtKBge2hNg1I2EZxN04FnGuZelJQqt5e3cC4g6NI1gwERYoPoavGf1
        1GtRWQPsKDTNHkgo7SH84xtmd1UOXVQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-aNcyJKgtOFOZgKrA5E_d3A-1; Mon, 14 Nov 2022 16:16:12 -0500
X-MC-Unique: aNcyJKgtOFOZgKrA5E_d3A-1
Received: by mail-qt1-f199.google.com with SMTP id u31-20020a05622a199f00b003a51fa90654so8865952qtc.19
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 13:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPyHbVIhVXxAvPHXANuB0471/7HtR2HBTgw/R/uDUnU=;
        b=2MLd/BquOaYvcA5BIyovf8pDfarIonLhi+g1a5u8w5d1W72t/OmEbmPp6aOgHrvcEa
         RN8Bnzs+qJfC1oZj3cFRFO3UHYt4nByYOy7CwqV3ddEFwOxi2/FnUnpxBXuDbIzKyCCm
         7pDyfZDHV+tOYskK8OGwN671uNaozVjOHcYi+iDJKJIR2AkvhVKNs5E30NPvVnQOnIil
         XfLys6ZAa5Oi4Jlhsw7Q3Z+sY0U1LseRuDa20e3EMHGZdNdtGPg2qoqu4NeyfbCfJzf3
         E5plYWAzaj/56RH0zSjG/18o6J0mmZ9tKYLIa82+90XNv80icGXprQnt1Z6lotXvtaBI
         VoHg==
X-Gm-Message-State: ANoB5pn5+p716P5MlAOwijhC8miWw2jV8B2Ceryk7CUiABMQvvd5oDFK
        SfsHmIFyPqpSpEcVow3DLmanYkAp/EK1TiUBgt6t9JlVP/k0FGTju0RXD4IXwmnvIwFC87mTaDB
        G3w+XknxvLhQEHnok2uPGYw==
X-Received: by 2002:a05:620a:3711:b0:6ee:96d8:962d with SMTP id de17-20020a05620a371100b006ee96d8962dmr12629988qkb.209.1668460572152;
        Mon, 14 Nov 2022 13:16:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6YzbTn7dUc6FTHqSRbY4M/FChvve5lyZZaDUwzmqNtHLCpgpJUTe0OMVn9VSvRM4ckJMFevw==
X-Received: by 2002:a05:620a:3711:b0:6ee:96d8:962d with SMTP id de17-20020a05620a371100b006ee96d8962dmr12629974qkb.209.1668460571935;
        Mon, 14 Nov 2022 13:16:11 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a254800b006ee8874f5fasm6999677qko.53.2022.11.14.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 13:16:11 -0800 (PST)
Date:   Mon, 14 Nov 2022 16:16:10 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Robert Marko <robimarko@gmail.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, psodagud@quicinc.com,
        quic_shazhuss@quicinc.com, quic_ppareek@quicinc.com,
        ahalaney@redhat.com, echanude@redhat.com,
        nicolas.dechesne@linaro.org
Subject: Re: [PATCH RFC] gpiolib: ensure that fwnode is properly set
Message-ID: <Y3KwGg0als0NyQ/I@x1>
References: <20221114202943.2389489-1-bmasney@redhat.com>
 <b3860cbd-0967-0b8d-3d67-f2a09f1e0042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3860cbd-0967-0b8d-3d67-f2a09f1e0042@gmail.com>
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

On Mon, Nov 14, 2022 at 10:02:11PM +0100, Robert Marko wrote:
> Hi, the following patch should fix it for you, I have hit the same issue on
> IPQ8074.
> 
> https://patchwork.ozlabs.org/project/linux-gpio/patch/20221111113732.461881-1-thierry.reding@gmail.com/

That fixed the issue. Thanks, Robert.

Brian

