Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D49937B30E1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 12:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjI2Kxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 06:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbjI2Kxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 06:53:54 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC1D1A8
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:53:52 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406589e5765so8665635e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695984830; x=1696589630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wGpIWOCzmeoLicebOPmC/f62gWnKlvDpIpZYug3qy5s=;
        b=DOEugTBnkaTj1Pm8na8RMF5PGYXK22kOhaV2ggUpHR5GG58XPsVIK3hZJdBxqu7Lno
         55NuyDxlwQBdQIYmXPZJu97qeqLutj7k2/ib+chX+06INyE8a50p+G5FKuwVKr2KsWCu
         HQHfPNrdyNDeojLmwlKQGwZ4Gv0RJaHe7M/I8aUVAH/Xkh4uN6ELXccge4v63qLQCRBY
         dW/E10xL5Dg5fqOOumnoztnNhuEeplfopwXyHckFFrAQran1SYA/uuhJnbrxo3wVxwiK
         iLdqmbk7WG0bYZcbn5+OMlIb09DbKQPXZ3c1uUlEVCCCZztC7UZ+uPbKGaBo79YDxy3D
         saYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695984830; x=1696589630;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGpIWOCzmeoLicebOPmC/f62gWnKlvDpIpZYug3qy5s=;
        b=bSEysPqIBpOSDw0J25R3EGFkKy319/Pcpck+riGCIdq82OvtKoew3HcdxjAJ6IXU01
         ++fjMWt0aYSoKamqvaleFjRl3bk2ZW7VQ+8m+xz76/khQkg0R6IwBbqgw2Xnubd54WLi
         cxdtySwBpspnWoQaUKC7k19Hr3U9G38/gQAknwPsDtx6xdJJhV2m0B1pTykwQOT4AGNa
         0sxQGaIpVyI+WjrTod71bUn2nFmcVJLJodMRGyXzuNgNGWKUW8rJgJ503W77wBe5LLf6
         xJbPl+zJZH0kCoimvJnzq9UfJbJ/LO4gSm2hcv9GK8zGmzyjjPaeWQ00nPav8vOCASNv
         93bg==
X-Gm-Message-State: AOJu0Yz9OvEbCXLn13r5Uj52KKLkeZhXBvvI1dsFwDV4XFB8gozY7f1S
        3+UfaMa4+CGmFTi/AUmx9sCkaT9ytTVkvlRR7ck=
X-Google-Smtp-Source: AGHT+IGujBFdgIVVAleTi/TRuEzsNReGECyU7pNOfmjsKXVQ08AwmdhBnwNeSxEfz/KTfrNiCt05Ew==
X-Received: by 2002:a05:600c:210a:b0:3fe:e7b2:c97f with SMTP id u10-20020a05600c210a00b003fee7b2c97fmr3294363wml.36.1695984830582;
        Fri, 29 Sep 2023 03:53:50 -0700 (PDT)
Received: from meli.delivery (adsl-146.37.6.160.tellas.gr. [37.6.160.146])
        by smtp.gmail.com with ESMTPSA id t25-20020a7bc3d9000000b00405391f485fsm1164716wmj.41.2023.09.29.03.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:53:50 -0700 (PDT)
Date:   Fri, 29 Sep 2023 13:50:18 +0300
From:   Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of line_info modeling
User-Agent: meli 0.8.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org> <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org> <CVUL0PI4MCEG.3H1JSHTV7KKTN@ablu-work>
In-Reply-To: <CVUL0PI4MCEG.3H1JSHTV7KKTN@ablu-work>
Message-ID: <1qu9n.vu3mzlqpz5kh@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 28 Sep 2023 16:24, Erik Schilling <erik.schilling@linaro.org> wrote:
>> +/// Line info
>> +///
>> +/// This is the owned counterpart to [Info]. Due to a [Deref] implementation,
>> +/// all functions of [Info] can also be called on this type.
>> +#[derive(Debug)]
>> +pub struct InfoOwned {
>> +    info: *mut gpiod::gpiod_line_info,
>> +}
>
>While going through all the structs in order to add missing `Send`
>implementations, it occured to me that it may be a bit confusing if
>only this one type has the `Owned` suffix, while the others are also
>"owned" but do not carry that suffix.
>
>Not really sure how to resolve this... We could rename the non-owned
>`Info` to something like `InfoRef` and turn `InfoOwned` back into
>`Info`, but reading `&InfoRef` may be a bit weird?

I think this sounds better.
