Return-Path: <linux-gpio+bounces-764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B357FECF0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 11:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19202822FE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 10:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491E1374FD;
	Thu, 30 Nov 2023 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBpeFecd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894C81716
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 02:36:52 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54b89582efeso774725a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 02:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701340611; x=1701945411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0R0X/tEDAFQ1Cw6FG8BvYToNksRWGXJ4ydPG09Sl/s=;
        b=QBpeFecdLMjmXMPxxBjS+RKUyRx/1TErLBi0eGPtknqV6gAwtALp13XooUOP1tk5F4
         XNumcPgn8VH9poJm7cajRSmyWJJVr5QtIa22jKsi8RFip+hsJMcuFj78YzmYQR1+v0b5
         i/9stUgfPpOy4e7ZpWROCCbHTnJYptDxzByUJygL4i3UVNt/PDEZp1E9mPWuZqc3Rf9R
         PlefZ9OpCrnCOkOFDs+t78x0Z/HUeWj9NCeWpVPsakGsVQ6EOxNqpybHB2eqSe4+XURh
         BoJCjgawPrPVN6l1zGNUVW2qvsPflCXqFIuOqkJpNoqYkQgFCFsp3Tjq/xmoqWqkDBoU
         LFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701340611; x=1701945411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0R0X/tEDAFQ1Cw6FG8BvYToNksRWGXJ4ydPG09Sl/s=;
        b=O984IVpc2Lmug6y8FFZmwdxLfsfyLUu4LQk8weMw95UpXBZvkVk5Smad0Xo++wpF4w
         doWaG6RpZZJPEnu/bJbheXNGXDh6ikfqSc33gVAV6/AQDiTLgZY/8PK7HMaC4Vm6wmoL
         40+86ipLS47qrvfRiUc4RxPxwerSfMZ44xnEXsaT0SF8E9OeloS7ry1qB16fs0EB4YXT
         5w2PUWrjRT/+abG8FAc+RaBgeJ2TkaVyu4Myp5JIKNSVbK/5AeEA3CE+jaBy8sMJrtPm
         vuW3NQGE4dmCHmwkULHLJfCK85mT0lsqFeSfbTabJXueb22t3w1JhKbi+AAz/8gRTc6m
         EYYA==
X-Gm-Message-State: AOJu0Yw/mfgVjLJQGgOb++q70tpY6V6DQAkNFuoV5UDJMLVM81NZMVRx
	Zelgm4Zy0ZIWso/CoWLfx5iRNA==
X-Google-Smtp-Source: AGHT+IHSTo3Lc19aaXaMuz3NLJO2FeJnZThgM8HI2fIhlr47DK+VLz5tc+AJKkty3uF+vWavD0hP1Q==
X-Received: by 2002:aa7:c68f:0:b0:54b:a930:b4c4 with SMTP id n15-20020aa7c68f000000b0054ba930b4c4mr5283992edq.15.1701340611019;
        Thu, 30 Nov 2023 02:36:51 -0800 (PST)
Received: from [192.168.209.83] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id v9-20020aa7d9c9000000b0054b1fca00c7sm417277eds.74.2023.11.30.02.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 02:36:50 -0800 (PST)
Message-ID: <34afe467-bf18-4328-8325-0f2cce4982d3@linaro.org>
Date: Thu, 30 Nov 2023 11:36:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] pinctrl: qcom: sm4450: Convert to platform remove
 callback returning void
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 agross@kernel.org, linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-4-quic_tengfan@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231130024046.25938-4-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2023 03:40, Tengfei Fan wrote:
> Use .remove_new() instead of .remove() for converting to platform remove
> callback returning void.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
You misunderstood me, this series now introduces a driver with known
issues and patches them up right away in subsequent changes.

What you should do in such situations is squash the fixups into the
newly added driver (e.g. by running git rebase -i baseofyourtree and
changing 'pick' to 'f' (for 'fixup') on the last two patches).

Konrad



