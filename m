Return-Path: <linux-gpio+bounces-27482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA521BFD66B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 18:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B511890DEE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E905286D40;
	Wed, 22 Oct 2025 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lEv1KweE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8DE2701D9
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151949; cv=none; b=UMzig/jeTRihpWRo5dlRXFjhukiXnevO7g1eSkpZHdvB6IqtgdXaOO+dX1o+FdNSXveJE0QkF/UOyo6tgNUQVzM/xLqW2BUihuUjFLoaklnVWLxvu5fIpAMleJ6Pp8xAMx8zUIeusdduDm6RSvsNuHIQD2fLV0QPW1P0qKP/92Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151949; c=relaxed/simple;
	bh=k1lox5HCPqKeslKTFtUQDp54wxWlGvYzkemwVt7zj5A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H1VpB3q3hMd2LGIhKIHKlVVaFtXiQv+Iy0a+PtcV1FAvQHmFdMxONLkGvL875t18VydRKOakpWddWZLXo8TdfD6a2t6P2KxQZtjTYlBE12Z9yECHdG2cXpnlBDijo58M5T7azS2hZwKX9hrYArtG5hxjMv7e2XXYEkkyWz7TEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lEv1KweE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so4933985f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761151945; x=1761756745; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37XacdJ9gFpbky/Uw+xLJQSiuMj+QNcWOMBwNotXM/U=;
        b=lEv1KweEBDKg9u7eYdVo0a1ZFQFmbcAZxo7jZ0qD0H7f3XM8YtOkhmwLLwT3U3VVbc
         UFZs3OhHe8ShNYy7060ykLAN+D4w8ttIf24L4/7wKYRSdyRrxi5tyfIkOEjZpbwdqAe7
         Lp3/wPxXPQLkpMO+GPSERkp/cMwNhHiEGIHhQ1qWLufeG5GJRSRR6J9kZe/wVvchy4zN
         LTvXYrvtHuu6Ozoa1seu+cF3fp60DIR+T+kyj/O7aWk4pz1ChGyOpGxOVZcDBssNVime
         juh8jDl+jAWm7GcZZAfYNAbPkSwxrQT9VWfM0Dqel4SU9TlcrDkaZw8YRJzpgIHKJGss
         1BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151945; x=1761756745;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37XacdJ9gFpbky/Uw+xLJQSiuMj+QNcWOMBwNotXM/U=;
        b=k85WrdutmeV52JRJBoCuFvp18xgJfni5Og4xaovVB0hHREpNd8ce+jc9fTyx1k/l63
         Rlo+RddEB1JEC6GG3n35iuKLcOuK5bw7TGvypfTQdbmQNyWPWnTCqEE9HV6UoWVHdyY6
         8lMv88DuMM5lEf8vHhLoBU4Lt0q/rvfKRGOJ/IOD43Sb8dD75DCt4lZSch7Dve5YzNlu
         lZOTJRTg5BY8/9tuWphd5RsKC8qX7e9QMWpNkymbGRxWMbzhxKSeK16SaJ4hbQEU6FqS
         8EDDvqyZ4SHFwTrFGLrBL5eLgDGlBAa1hVJi4/AkX66BuJnrrFnmE2iTf4tl144ygq/k
         143Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBa2t0ZkIHCtXwezCPYkAGI5aCrfXN/yyv9kskA6jumIOALuZwsuG96lgCbYtVdhVkirmpmN08v13f@vger.kernel.org
X-Gm-Message-State: AOJu0YyTgXf5Jqzozz0R1bCybIsg9D/DBiGIMdRTNvWRVc2Ma1whrqXq
	SivCb5J+CKVp+7kQbKWCxQ2kaczk09KfVm3Cs5Cja8TcZMBMIAxkRFP5Jq5xPO5VGzo=
X-Gm-Gg: ASbGncvBfmoz0Ft/JQQu9NeSzhsBOnv+ifwoxrj2+nMTxVyMLgIVpjBjRrFAu8BIWVZ
	blBySENz+vUbfDLvwAKKvl97isyCVSysnawEMTVaejyWCKw+wO1FupPlTy3E6ZQSq9PekZrHjWB
	YneAzbKeAgcpxpKZvidRH6n0MmVn8FEbJgdVILxZE0qtqPQ79dceGBYIJzZAKoVl3fATi/IOpid
	+3iLzwv1Iz2lhFmSUMLXbpHjxyYJDOOw2hEZ4aEu+hYDhNExc7pKs+iVltP57JHrExZwLXRSty0
	5shaH7twl8rkJNCzNyMT8XVYHKefpqcMc9B/4gTkvdX9iMT3MUwQoLHYp7KU4l3tb4Tgd3JsaNf
	vjsS8A9WLn+OkGBdrFIPmL0XEwftayZ+KaMRb6CSI0gpVdta3cTeEphEYbcW7bhcysYwMjy1LvS
	C7p1dQl8gMxe+MMJA=
X-Google-Smtp-Source: AGHT+IGFOe7mdI2kEMdRKUAfbbhGpFj/a5aNDnUXnkpzyrx/acBYIYP5vLTNIADhuJOIFJaea5le2Q==
X-Received: by 2002:a05:6000:400a:b0:425:769e:515a with SMTP id ffacd0b85a97d-42704d9e8f7mr16851522f8f.42.1761151945204;
        Wed, 22 Oct 2025 09:52:25 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce3aesm26307158f8f.48.2025.10.22.09.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 17:52:23 +0100
Message-Id: <DDP09DUCGNDL.24UBAKUA640NO@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
 <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
 <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
 <450cac8b-598b-4f47-8bf0-43c805038e7c@oss.qualcomm.com>
In-Reply-To: <450cac8b-598b-4f47-8bf0-43c805038e7c@oss.qualcomm.com>

On Tue Oct 21, 2025 at 2:13 PM BST, Srinivas Kandagatla wrote:
>
>
> On 10/21/25 2:03 PM, Dmitry Baryshkov wrote:
>> On Tue, Oct 21, 2025 at 01:56:09PM +0100, Alexey Klimov wrote:
>>> On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
>>>> On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
>>>>> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
>>>>>> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>>>>>>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>>>>>>> controller device node required for audio subsystem on Qualcomm
>>>>>>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>>>>>>
>>>>>>> While at this, also add description of lpi_i2s2 pins (active state)
>>>>>>> required for audio playback via HDMI/I2S.
>>>>>>>
>>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>>>>>>> +				data-pins {
>>>>>>> +					pins =3D "gpio12";
>>>>>>> +					function =3D "i2s2_data";
>>>>>>> +					bias-disable;
>>>>>>> +					drive-strength =3D <8>;
>>>>>>> +					output-high;
>>>>>>
>>>>>> I.. doubt output-high is what you want?
>>>>>
>>>>> Why? Or is it because of some in-kernel gpiod?
>>>>>
>>>>
>>>> What does "output-high" mean for a non-gpio function?
>>>
>>> This is not efficient. It will be more useful to go straight to
>>> the point.
>>=20
>> It is efficient. It makes everybody think about it (and ask the same
>> question in future) instead of just depending on maintainers words.
>>=20
>>> This description of pins was taken from Qualcomm downstream code
>>> and the similar patch was applied (see provided URL in the prev email).
>>=20
>> And we all know that downstream can be buggy, incomplete, etc.
>>=20
>>> Back to your question -- does it matter here if it is gpio or non-gpio
>>> function?
>>=20
>> It does. The I2S data pin is supposed to be toggled in some way by a
>> certain IP core. What would it mean if we program output-high? Will the
>> pin still be toggled (by the function) or stay pulled up (because of the
>> output being programmed)?
> I2S lines are configured in push-pull mode which means that the lines
> are driven high and low actively, am not sure why output-high is needed
> an what it means here as these lines are actively driven by the controlle=
r.
>
> @Alexey, what issues do you see without this?
>
> Am not sure if pinctrl driver even cares about this if we are in alt mode=
.

No issues. Not sure why the problem (if it exists) wasn't reported or
fixed, say, for sm4250.

Thanks,
Alexey


