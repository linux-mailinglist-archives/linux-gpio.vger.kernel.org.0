Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A96D7123EA
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 11:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbjEZJo1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 05:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjEZJo1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 05:44:27 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2BCB3
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:44:25 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-95fde138693so312694566b.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685094264; x=1687686264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5VbCUMv/QaS1fw1aanpNMI9gyy0ZMlbKYJ5fMBaDxw=;
        b=At2fFE+NDDPb+r3FayvGQc+gP0LHCgdMy8pZEjHIrIXlnSnEmST2hVmkmw3zU0JZi/
         zZpQ7NXqwFKLrCOk+NNkH1qRecWArQ57g8FXhvRQm0tUIZ9PxnvtpGV13AZCYEM/fYCt
         o7zCvKIZSkRLkNaCKaMXfro1tZDJSr3bCifTUhaY2qf/eD2d0oZLP55Ssg3jxJzGA8n9
         xP1WwOsb1HpmMxSTUgXbq6MOJ1iX/PTxqFy5BmreasFHghDy0g55OCNIqfhKka9rnooj
         3rjRGx7QIvcFPZIdBgS5lMRNUp7U+TpYxBOVUDXXorzXWpm9OKr+7cDq5FaJGuMyzupe
         1VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685094264; x=1687686264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5VbCUMv/QaS1fw1aanpNMI9gyy0ZMlbKYJ5fMBaDxw=;
        b=FyvG4n5Ns9lxKL8fByVi/k+dOjoO+nTt+XBVQj3K452bvQBgj+oknfZaVhOzGgCn3m
         loTsPeSonYq4tN6ECzkAzEYERHmARyew1KMmphQh4iv5nhKhJCCBR4AOBw6WgK5eJSqX
         LlGaFn6bhfpw27bR/3acYBUK90EokBSRUn3Dj/niR3Nu5zlceSNutPHHux0YtU0+HGax
         B6AMUIo0xBe5cOkjbPMnmLmfAudATrgmx1etzctZ53ZFEGJ2HwK7ap7sCK6mQNr4XBEm
         h8QB7Z8ddN0LVUUXxmtVHpPM4f9TFOfOCxmALTyqNXRK9Al1v4JiKHUAnIA6AvXbNQfT
         yKuQ==
X-Gm-Message-State: AC+VfDyB8c1OypRLlhep16SsyXjAt02t8UW0DDier3Gb0MZRvEde5U6V
        qHZ7gbg5Fy0pT2QQ+98SrBMvyA==
X-Google-Smtp-Source: ACHHUZ63gKg6QmbYpIYWbXLcmJozihLs159+/l0rGCrkGLEc9QT6QhvltV1lI8NfHeiNq8p+OGn9mg==
X-Received: by 2002:a17:907:6e14:b0:94a:653b:ba41 with SMTP id sd20-20020a1709076e1400b0094a653bba41mr1020019ejc.15.1685094264317;
        Fri, 26 May 2023 02:44:24 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906278400b00966056bd4f4sm1909787ejc.28.2023.05.26.02.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:44:23 -0700 (PDT)
Message-ID: <4673ba16-a8fb-453d-a80d-bfb7aea7f9d0@linaro.org>
Date:   Fri, 26 May 2023 11:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Content-Language: en-US
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
 <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
 <20230524081454.ztcywdhjgw6axvjw@vireshk-i7>
 <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
 <1b9968c1-77f3-6525-af57-a6c7808adb59@linaro.org>
 <CACMJSevb+-eCe+PPaY-=bXx=5t7+sg8BT+9ZYO=t=OzC3hmwHQ@mail.gmail.com>
 <c561cadf-50bb-a42b-5454-610179bdb1ee@linaro.org>
 <20230526093150.5znk6hdxzhhezuhc@vireshk-i7>
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <20230526093150.5znk6hdxzhhezuhc@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


>> @Viresh: Could you comment on the use-case that you had in mind with gpiosim
>> being on crates.io? I am not seeing any good options to package it if it is
>> only intended as an testing tool for in-tree things.
> 
> I thought vhost-device is already using it for testing, I was wrong :(
> 
> So we don't need it via crates.io for now at least.

Thanks for checking! I will then just send an updated patch for 
libgpiod-sys :). If gpiosim becomes part of the public interface we can 
revisit the situation then.

- Erik
