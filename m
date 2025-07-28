Return-Path: <linux-gpio+bounces-23864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E227FB13AA1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 14:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176AD16880A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 12:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ED82652A2;
	Mon, 28 Jul 2025 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDEgH2tj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87101264623
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753706220; cv=none; b=i/yVogBj0STh7cDAD91vgZqZApGQVBCg17aQdfQUU+/0Tk2JW2GLR5/lbOuJZ0vBGRVAX6XRukQrAaybIKSAlp1kuzhrfsGwPZ6cL37nly8p3CVOyrq8lz1RPYmzfHq06PDhBH8Lb9Bz0xkfqIhG2P+HLfuN6JYhuTq0KRq1UWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753706220; c=relaxed/simple;
	bh=mZG68U145bc9NpABMY0pXoCv9xsjDo8q/XMbf8MXVqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRjw6zzDTGXFjdWgPoElY221kMzXv6DE73jVDCDDK0QSZHkcAJ57krS0M6T5+5uAhZ7qbYq3MyAD/X9xmdVdApQu0nnSxRHjWH42PakSgcGm/S62K43/LMpcn0CfRyu2iBovadMOdOu/QC6G4ZZ5ZOzDc5boAq9U3rsXbYSYsrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDEgH2tj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlPaB017807
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 12:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+jULI02a8P5hXHovIvLcRS3cL3QiDHFx1hynrPU7Jo=; b=bDEgH2tj6B/SugY/
	CJsPkfx92E/weIRkNw4bRPtV2DKVphWhS++Uas7eGKOwd2qEwbU+q+LjuSjEpdCP
	+HPF/QGLFaUp+WaWmTm+RbF5046PCHVg6lA5sOf27iE6YvWygtXu6i8S73JA2fKg
	oqiKC3nJXPUEx5BTEMAphRz95YqnHNODZ1Q3OJtZi3fGwHxXJc+EM5G55e8zTfpJ
	D7WcV4r8kBtHtckwhd6tNxwQPgXZ70GObaks7iRHQeabTjd3np6nEXsccyIsBHtW
	6//prIZoUTXgdFUN2UGLC30IN5s/CU1gYQw77tF2mXlZ31kdBZ02GnW0/eIW3ugj
	Y4g1Lw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1acjtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 12:36:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-75ab147e0f7so4396094b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 05:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753706216; x=1754311016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+jULI02a8P5hXHovIvLcRS3cL3QiDHFx1hynrPU7Jo=;
        b=kPFAOyErCIpFcudrgywlwBWkKylYJBtIb5bMPsdUN9zwOCHIeXNF4r0Ek2ROtsmI+0
         3aPxi7ugWpsMrbCdu9sYCvh4+JHzRhdOYY8jcDWblmHRPasFaGCgLTfHbyDIHB3l+jnk
         LykTEczk30bKf3g9x7H4SFHzU4cD+tcY4TW+PHUcuZV9B2QHliTtcMvWnOt9HbkGD3Bp
         V6JUV7Gg2u8JEmQVgBUuKB7bBBNZhwpgb8PMYGKEUDiL4JEyFl7aVehTNIQJhIXb828/
         6sJTGhgHJuVNl7JSctfHC4ya/WdVwgN0NPDHgHCjjqiIkNF4DtVgoKf1tRuw3SOKaD7m
         CkpA==
X-Forwarded-Encrypted: i=1; AJvYcCVg1VesoXqLRtxGCCAwHuXQJ4w2JSDlnQO9iYWjgQRwv9MnR4JQQpcRl4X3y8H5s8r9ctdxnPAqv1Up@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf3QzCxxOSHjiK9VwgAkSw9+KWGB4/vgrSzqBrk4ePuLyL3wmg
	+Rc5mllTtSvv3KThiGh/mFsZ+FJKu55aWJ64ToQ4KUk5ZNAknJm7AFBwfQ3nAtQQtTv9oaJGVrR
	+bGxbKPhEz3ZXVfa6WJn3MkCjq+m7f1oh77TBRjdJ5xfjKGgL/IdsS5mRxBZYhHfa
X-Gm-Gg: ASbGnctb/jRmJmpTbj+bZAiC6K7DcPGC+X0R2WM2RwbeTz7liJCW5EjUzGyocrvAJkL
	kQu5koda7mMBm9BcCfIFMs34mtOSNTXWWkck6EuWq3MfapL3CIT0fYAgfaga6r5mhOe4UrFxsAt
	63745bv6vvtIEWmJRjh/Z7cUQB8DLiFd3FBGuE7byZ0OHYxoze5qrGvEVfw4EXkIeXvKfOSNAze
	ijsgeNL0BtwGnGaztClrMpPwzHttBG45zf5ff2Q7uvBcpDyf9x8aBUpdfAZ4uUuIJFfPRfnNfny
	l+xzp7ulsZF7gzFWgyjQmFNUXTKepLEixfNWAcX9WQe3Wm5KCAgpp9Y09f3uHGhSlu5HRjGcK3Y
	O3A==
X-Received: by 2002:a05:6a00:cc3:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76339569eeamr16383494b3a.23.1753706215907;
        Mon, 28 Jul 2025 05:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbKTYrncloyPw/ezLKjdLOdPuFqooqOq468nbcvdXeufgeWmiXla7My/PA/S37rd9050aj6g==
X-Received: by 2002:a05:6a00:cc3:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76339569eeamr16383457b3a.23.1753706215392;
        Mon, 28 Jul 2025 05:36:55 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c0271csm5534607b3a.49.2025.07.28.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 05:36:55 -0700 (PDT)
Message-ID: <aae92260-5169-4af1-97b0-48f364612dca@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 18:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: codecs: wsa883x: Add devm action to safely
 disable regulator on device removal
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250727083117.2415725-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <07faf0cc-a8e6-426d-b397-dfc321a7f3df@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <07faf0cc-a8e6-426d-b397-dfc321a7f3df@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eurMwFYGKA8zBIDdFea5C7Rwl9Q9aPZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA5MiBTYWx0ZWRfX+zoSDuVhA+sk
 6afNdojD4nkI+hZjFWV4QTbZH/n9KCSv91bU5Eivl+4msiIMHSuwIGc2vpB7x1Ji3ABXhFJpD7Z
 4UnxFWt5Bg76xVFn/diXkom83Mrip8t2DFymqcMMFLhKTx5uynem2qNDc0YhJxDtutA0TTs1PZs
 cpRlGmfGfPPxNc4auKwCMmT/OkVYrZVti6kSFB0sE03UNYvFJ6gppC2YGg6uf8iAdqAtrq28DvV
 NSnvtOmd83DKWKHOHunjbwd0h/fGq972RPAvAH6XYdS77WqUgiaiQPUC9yPatCPMJNzrdIt0Z3x
 VUGk7s/2oAXMRxlRCLSXvmI5pnk1sKR9slWreIqA2CaSFYicoF0yUVca7AKtQl6baC0dh7zCGZv
 fU9J/dGQUUWpRic+BBkPb/e4zjCeWAZ3JjQ6gks56CexaVdj8FmXDYWdZ1VA3G/kBYFw9DsI
X-Proofpoint-GUID: eurMwFYGKA8zBIDdFea5C7Rwl9Q9aPZ0
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=68876ee9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=4BO2McRAkM1DgkD1vDcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=5 suspectscore=0
 adultscore=0 mlxlogscore=467 bulkscore=5 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280092



On 7/27/2025 3:00 PM, Krzysztof Kozlowski wrote:
> On 27/07/2025 10:31, Mohammad Rafi Shaik wrote:
>> To prevent potential warnings from _regulator_put() during device
> 
> Warning is either there or not. Either you fix real, specific issue or
> not. The code looks correct at first glance, so please describe exactly
> how these warnings happen or how what is the bug being fixed.
>

The current wsa883x codec driver manually enables and disables 
regulators during probe and remove.
In patch v3-0003, reset functionality was added using 
devm_reset_control_get_optional_shared_deasserted() for shared gpios.

However, during cleanup, this led to a warning:
"WARNING: CPU: 2 PID: 195 at drivers/regulator/core.c:2450 
_regulator_put+0x50/0x58"

This occurs because the regulator is still enabled/released when the 
devm-managed cleanup path attempts to release it.

To resolve this, remove the manual regulator disable logic and instead 
register a devm-managed cleanup action using devm_add_action_or_reset(). 
This ensures proper cleanup and avoids regulator misuse warnings.

For reference, the wsa884x codec driver already follows this approach by 
using devm actions for regulator management.

>> removal, register a devm-managed cleanup action using
>> devm_add_action_or_reset() to safely disable the regulator
>> associated with the WSA883x codec, ensuring that the regulator
>> is properly disabled when the device is removed, even if the
> 
> Device cannot be removed/unloaded, AFAIK, because of suppressed bind.
> Regulator is already disabled during error paths, so that part of above
> sentences is just misleading.
> 
> How can one trigger the warnings?
>

The warning in _regulator_put() can be triggered by applying patch 
v3-0003, which introduces reset functionality using 
devm_reset_control_get_optional_shared_deasserted().

Since the existing driver handles regulator enable/disable manually, the 
devm-managed reset cleanup path may attempt to release regulators that 
are still enabled, leading to the warning.

This issue highlights the need to replace manual regulator handling with 
devm_add_action_or_reset() to ensure proper cleanup and avoid such warnings.

> 
>> probe fails or the driver is unloaded unexpectedly.
> 
> How driver can be unloaded unexpectedly?
> 

"Unloaded" might not be the most accurate term here. What I meant is 
that the driver’s probe can fail due to an error—such as missing 
resources or improper regulator handling.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof


