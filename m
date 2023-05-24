Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD86870F063
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 10:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239580AbjEXIPA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 04:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjEXIO7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 04:14:59 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11D69E
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:14:57 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d2981e3abso470063b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684916097; x=1687508097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsYmRkiXaUP31aFCkBUt6au+hQvnuJZWE26TJudbqdc=;
        b=i/JzN3tflHMfVrFcDTty3qPL4tDCBEi/V/dreARVDl87wJmRKqt7rkXv8OWZbn3IFT
         xM909C4fVpep+WSyrM+sPo9dr2tQm32DaFJ01nBQ+e0iDHbcu4bYRxudMcWmyX5x/P19
         3SYPr998wc34VYTExl1UN31fP+lx9k5n4MeinMT7hyaXhVXqV6/j6j7SRZ0n4lNBHoju
         8Kn5d4djTfkeNmBnQrhO9Rt2XRBl/7kjxBwX4Jf+DX6F32geLiORLBQOi5hlipv4PAVA
         PfRCXjN66ELo5fYbNqKVjpng95EZTpZ9ZMMGFl1KzkESDwQVcqWFlze7FDaw4y1LvNyZ
         A9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916097; x=1687508097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsYmRkiXaUP31aFCkBUt6au+hQvnuJZWE26TJudbqdc=;
        b=dnpitudOMyi9r+NXwqVnwJlYKO6xhNH91wyc3iWJK/XQjeVKdmqtOUOAf6kxHXNTr/
         d0Db0IQZJOEO5H8SoZqnBTKs1XeFIf/8d/0Po4YKJ6COTlnLluS5TqawX9tu7h/AhvZG
         C0c0v1JB9t+7CLE0+kULR1PCMkZw2I5HmBgMZ9M1kxuVux+qI44e7uPHCQQt7GvuVFTl
         VV+gwWT9nZvM5pXGHrEIvh6nXwTOcxuI5JQ9rjxDMb55aLtQzd+Q1jnW3be0aEmbWXTW
         IRwQPVif/MqBVs1NoMFI0w9mCjwHYD4h5kNU4h9RaEv7JA4REJh+pjXmR0GaVt/MrKyY
         XMzg==
X-Gm-Message-State: AC+VfDzcQ5Qo3VoqQWMJUjstQrR/Hx2UFIC9USS05JXhUMaZCO27q5Z/
        JVMojeyM1VpRIQMqKBiqSIKt+ORnW/XBFStF7cA=
X-Google-Smtp-Source: ACHHUZ5R24Rx35eLmFvdYB52+rRDYDrDp+5Cbd2TbG+V7n2Y5Ybv5TCeoRZJL6LSIGAuhQSYCzDdgw==
X-Received: by 2002:aa7:8896:0:b0:64c:ae1c:337f with SMTP id z22-20020aa78896000000b0064cae1c337fmr2589097pfe.12.1684916097304;
        Wed, 24 May 2023 01:14:57 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78811000000b0063f00898245sm6833263pfo.146.2023.05.24.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:14:56 -0700 (PDT)
Date:   Wed, 24 May 2023 13:44:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Message-ID: <20230524081454.ztcywdhjgw6axvjw@vireshk-i7>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
 <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24-05-23, 10:09, Erik Schilling wrote:
> I am not exactly sure if I understood the above comment correctly. But
> if we want to eventually be able to consume gpiosim-sys via crates.io
> (or any packaging mechanism that relies on cargo package), then we will
> need to decouple the header and .so file referencing in a similar way.
> The easiest solution for me seems to be to just add a pkg-config file
> for gpiosim and use the same mechanism that I sketched for libgpiod-sys
> here.

Yes we would like to get gpiosim via crates.io as well.

-- 
viresh
