Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1742172A703
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 02:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjFJA2B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 20:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjFJA2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 20:28:00 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED11EBF
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 17:27:59 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-652dd220d67so2426258b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686356879; x=1688948879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VpAvbUm+yHm48cQ94ALRhA6XR04ymUkBJGIEesW2BHI=;
        b=Zo+nNyfjaZsyn4CL99oqBQNtvup6+oaKCsiZCnSGnaDaaAPEpay5esCyGgh/qQoVnZ
         x86SPbF2oO473zsgVTYO1QICLa2RmdjDif5nj9AZFmmDPy+N17cbLs0qICxlnW2pjtYq
         O/oHIQO18CDE6+8K+9CNUbxZcLaiRw8sFKQ/J1hKlOczz85EdVcXuhtyH8QaRUQgnrHL
         BiPt7zZyhfcBQI+TUNfT9hiDZgmQssbCHobH3+DhM/090kfjEYl/TJQRSlNVXq1+xwoH
         56EDhD29t01mKYe4/QmVkN0qMoxkd7tBTXL2JtS/0hWN+vMvVZROfc9JpZX39orgRGex
         XksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686356879; x=1688948879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpAvbUm+yHm48cQ94ALRhA6XR04ymUkBJGIEesW2BHI=;
        b=HxruBucTotyeWnLu5VEGTpojMF5x7quNwpwsCQ6LLOFIB+oDcWH68g2uS2Oh5dscA2
         hSFj1lj9txP2WUs7aFlxYojzN1ZIzT4GKUoacRbj4JV7R+ruR4QlsKJDDByLGsz6oUZK
         QJVv3OwoOAJFadVmwk5/v6A5fbg5ARbxMQmFMXiT5XVOHHg2tYfloR0sRc4t5GVUCRub
         MU3YpNb2fKECRcBOtzRMtee13rGaig1PpZaGva3raOqdDrzGFvs1OUEoQ/GExFuk0u4s
         r5kwV01oF2PDiQPPvJcBa1PEzihYxyGopra+Jl7bQa7kL5PQY30rK21gyD0ekAWkyshx
         +gsQ==
X-Gm-Message-State: AC+VfDzvyMpaNLSTdd8zt5+8GmDQL1Ddnyx4bawlNZ9/uX8QjE9jVbg9
        NI9aRJSYlKQArdnDVdZ5EWa+O47dedA=
X-Google-Smtp-Source: ACHHUZ7GKuLfGIrDiFAxs+ICnVmJAlczsKO44r8hXaq0xcNB/fcfiSqPep8+bjS3RYMZXRwgEc/ecw==
X-Received: by 2002:a05:6a00:1951:b0:65c:1170:6cd4 with SMTP id s17-20020a056a00195100b0065c11706cd4mr3197733pfk.30.1686356879314;
        Fri, 09 Jun 2023 17:27:59 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b00643889e30c2sm3145337pff.180.2023.06.09.17.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 17:27:58 -0700 (PDT)
Date:   Sat, 10 Jun 2023 08:27:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] core: doc: add doc for opaque structs to link
 to the relevant page
Message-ID: <ZIPDivT7dh/IXX/L@sol>
References: <20230609073957.72418-1-warthog618@gmail.com>
 <CAMRc=MeX2Pc1vNc_p0WLfQoBx-UfHFA5W0Z=3r8-Ocy9bDNXfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeX2Pc1vNc_p0WLfQoBx-UfHFA5W0Z=3r8-Ocy9bDNXfw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 09, 2023 at 10:17:13PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 9, 2023 at 9:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> Thanks for doing this. I tweaked the patch a little bit and applied to master.
> 

rtd updated with those two doc patches applied to v2.0.1.

Cheers,
Kent.
