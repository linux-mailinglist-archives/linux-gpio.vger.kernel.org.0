Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F45779ACCB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240103AbjIKU4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236623AbjIKLHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 07:07:12 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9990DCC3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:07:07 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bf924f39f1so10565341fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430426; x=1695035226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=;
        b=hE0UzNOildrc4RtjQlC+RP8Kk8xdx6Ya+Ekn5wJ/mahURugJQ378ozWVwxwNvye0ph
         n92OzvajmrHal2Bn5EWHx+95chi40L9o3jccAVeRv0cWfirw9o2FReWCjrqyQDPaQsL2
         kL35iYvgHu2HQic9ztnDQNByUaZh/NcvITlULH8CTBJRhweieQxtH23b2TLKg4Y+jM7v
         SF3seT8EA/gqrFfcrQLBm0BZuVwjMXfKewd/h0Fbh8HIh1pgftR85XVP5n6/bFl9iWiK
         qALytUgT8moTF5mvDYaQ6tSZXqrXDBYb7NY8KVlEXa4Az+fhGxlY1QchZMBnD5QIdm0o
         qBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430426; x=1695035226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=;
        b=NoB57fwQ2UzwpixPderG2Pd4uU7g+ldTKsD4U7OpMzhpDPHwopNoA3F7xGFU3+3YmL
         mMVmegEy1AHXM1vm2thIuuUltUaR/IjD7ux2rXov/WFc/ff74L1Qe8UkRx0p52YAyNcA
         KVxaJj1/dNJ9JaByet0TIsNjZwcppau0/4jmbVc+hqMHkND0rx/Hw/8Bvezv5e1rOX5c
         ko9Om66Jcspx9iXzsPapmqTLa9qBcZcgVrDRo5dkjOhkaMkKDq0mMXwIpMSI/Hnw4qGm
         KNduVLVsxHdF+PeJo4utgcwcfLHnRb48b9UL7TQb9mj6IfVSpN4Xw+LFOjr7SNZtNXDo
         ubEQ==
X-Gm-Message-State: AOJu0YyMt2yZN/8eKrarcd7/Oa0X6SBRy0RW6gIwEXg30KCfpe0PWopu
        0lAlxohEoVXQ082xdFnKzbzxvA==
X-Google-Smtp-Source: AGHT+IFR8IFxIJ7reSkaYfAFLu1yRY1oO/AEBb0QIMYpht4GuEFk0sZxNE+qAxMWLhq3G4SDtzJ7xQ==
X-Received: by 2002:a2e:9ed7:0:b0:2bd:124a:23d5 with SMTP id h23-20020a2e9ed7000000b002bd124a23d5mr8252127ljk.11.1694430425888;
        Mon, 11 Sep 2023 04:07:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id qn6-20020a170907210600b0099d9b50d786sm5219726ejb.199.2023.09.11.04.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:07:04 -0700 (PDT)
Message-ID: <e35a8b4f-ba1a-514e-9c59-a74442f0cb1f@linaro.org>
Date:   Mon, 11 Sep 2023 13:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/09/2023 22:16, Mukesh Ojha wrote:
> +/**
> + * qcom_minidump_region_register() - Register region in APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +int qcom_minidump_region_register(const struct qcom_minidump_region *region)
> +{
> +	struct minidump *md;
> +	int ret;
> +
> +	md = qcom_smem_minidump_ready();
> +	if (!md)
> +		return -EPROBE_DEFER;
> +
> +	if (!qcom_minidump_valid_region(region))
> +		return -EINVAL;
> +
> +	mutex_lock(&md->md_lock);
> +	ret = qcom_md_region_register(md, region);
> +	if (ret)
> +		goto unlock;
> +
> +	qcom_md_update_elfheader(md, region);
> +unlock:
> +	mutex_unlock(&md->md_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_minidump_region_register);

NAK, there is no user for this.

Drop all exports from minidump drivers. Your upstream driver *must not*
expose stuff to your vendor drivers.

Best regards,
Krzysztof

