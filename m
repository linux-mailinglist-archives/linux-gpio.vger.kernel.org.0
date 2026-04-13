Return-Path: <linux-gpio+bounces-35076-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA8RDjWx3GldVQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35076-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:02:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7320B3E97D9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0D2E309A0F7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 08:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5EC3AE185;
	Mon, 13 Apr 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3ySkQgwO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F73AE188
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070540; cv=none; b=luQl+jnp0TK/Bk7/NGIz8YzjlqxSVDUJjmnnzti9NQGGX5BRLhyYmSBUM5ShKvHPHgxc6LsIfEyIa4/1CfZ0O4jrKTcdEiWDWEkw/GEEhpwmnXTGHsZqqeDpj8VNwSny4FP/8GvitSwMM47Z7n5SVtfhV2DTobqEdS+bMYPpySA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070540; c=relaxed/simple;
	bh=D2aNysoazoEf6/3/6uVC+sJTR09Ue84s0LX25WaCQV4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IKEfzL1i8Wg8l8vvSSxzXddpUwDoHkzdTDeZOJktaqZgj338TUDSIfSlNr2BhcKinIZZvCiuqyf7k57JlJeUkYmhAj8/J0XLVFDxkfK19Yu1s3/aFDYy1ljFbsh57YFweyYGFSOKy8W112LIzEwCpuXbpXnPj/b12hom4Cf1oQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3ySkQgwO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b982b0889d8so561546766b.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776070537; x=1776675337; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgkijLDEm/ABnCWLRgQ2UF0+RYV7WyoElCsuBhyBG+M=;
        b=3ySkQgwO1yZUTJN7Uh7h1KMS56P9ifn7KdETGkcTLiVChB2Qw2TlNtKN/coIoE6lPc
         IF6nGIAudHvXq8oUM/UmKHvXVSjz+5i1Ihx6WGEkB6GUJ3cl5QroEePEKdsxu+OTUtzo
         yoG64nlnabwKyAE42zkWSB2AAyLoyzcVFjTzKuZtUPVEkVOTcUEYtSpvPh6LQtsB4C0e
         5o3KzNNYwHa5OsEcvcRcGgtQrgfd1igyjGe19BDr32MhNwFgZqWDuk5q6ANuoDgZsUBP
         V91hNWC7ZBenk5R5Y+YlxKLpQ7lBFXox5XwkNA855o6XO2f1+1z0MNp/eVRSW/b+Bwmq
         gsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070537; x=1776675337;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgkijLDEm/ABnCWLRgQ2UF0+RYV7WyoElCsuBhyBG+M=;
        b=GGnX3IoqIbICR2c/MLCsfKmTqnpNgecLML142VMGIVl3PH7Dy/wv/8wuD/cZMy3inY
         pvwX0TqtVWRwT7o30592o3gKYO2pC7ftiWLJKc9/XxDkxb138CzNwGq6psGuvc95S1iH
         pImRIy+Jlz0UxLZ9OzDfcG/6GRnZEjqXMRv2o2++JAjP8RqFfxV5+ebLrdJ1NJEfgG0b
         /0Mw7xBJI0VtslimlwL2cOuLcKHJuF32HVzTbPFivp/OF0JfOYSsB3blPdMTES5hzKkt
         cn1uFX0w5hIojpxh3nrsBtRWh4GsJOmrQ9Y+aLaRpbzlNSqMtvszISTRFPnHm/2EFbxG
         x01w==
X-Forwarded-Encrypted: i=1; AJvYcCXAqEjpP0VRwO7uvRciKi8q22ieLs7ksQ4q1/RYb14qerATqGGNAfcjFGAPBze3O45dQhjScEoEbVIC@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZNBJYw8MZUgu9hRp+W4Z0X8+eHJM8WvI8UgNinRPeFXUMkO9
	dE4Okf0IpsryaDkjOurmy2vFqnzHhOx7kxLqxa4zco8pGNlNCwspLG7GiNb3mVXzVuE=
X-Gm-Gg: AeBDiesnYnDsOffrA+nwkadMU4o93xAFrojVutTfbmqzvcl2KkVl/HFnHCoqshxMAj1
	vQ2RK5aLkNSerbnzF+9NesLCKRm+z4V5H4zTOFcsCKiiz3/nwdNDmYPUjza764nwe+r1e3yjre4
	cHPbMsxWzr5Kk2jTLoussrNhckfnopbfAwdQ+uQCUn/8um+pOB3HWr18wmUFFB9yDw5+w2VFePh
	gDOaAJq/N23a3+/FLL7cvqhrGDshQyxEhtpgsaE7tWP9dYL7rmIo0UqrkeaNASmuC6KRX9ntm66
	CG5t7581w9jfUIhSQ0iawj1sr5kEuay+KNRe4pII/zG5C9Ux96POiDDtSb+mIRDLM5GNYTIIX9V
	VvvMG3VLG7DFU2dS+Sifo9/QKPNc3lKZvSkF99ODc8AdCtN9Jx6M+UBlQ3UveLwzxXmiAX83bl4
	3TlWpvV0QY3Er9OCtf7SNmeP2JSalRfgm/MYZm2mQr/bAQRyxIsyWrghHkPCZkYsQt3X9S
X-Received: by 2002:a17:906:5991:b0:b9d:33ce:e85b with SMTP id a640c23a62f3a-b9d7277bf23mr526436266b.43.1776070536883;
        Mon, 13 Apr 2026 01:55:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm283831866b.62.2026.04.13.01.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 10:55:35 +0200
Message-Id: <DHRWGKASOFM8.15ZNMEOJJK9F5@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
 <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
In-Reply-To: <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35076-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[33c0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.software:url,googlesource.com:url,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 7320B3E97D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On Thu Jan 29, 2026 at 12:19 PM CET, Konrad Dybcio wrote:
> On 1/29/26 9:32 AM, Luca Weiss wrote:
>> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 +++++++++++++++++++++++++++=
+++++++++
>>>>  1 file changed, 66 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dt=
s/qcom/sm6350.dtsi
>>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>>  			};
>>>>  		};
>>>> =20
>>>> +		lpass_tlmm: pinctrl@33c0000 {
>>>> +			compatible =3D "qcom,sm6350-lpass-lpi-pinctrl";
>>>> +			reg =3D <0x0 0x033c0000 0x0 0x20000>,
>>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>>> +			gpio-controller;
>>>> +			#gpio-cells =3D <2>;
>>>> +			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
>>>> +
>>>> +			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPL=
E_NO>,
>>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>>> +			clock-names =3D "core",
>>>> +				      "audio";
>>>> +
>>>> +			i2s1_active: i2s1-active-state {
>>>> +				clk-pins {
>>>> +					pins =3D "gpio6";
>>>> +					function =3D "i2s1_clk";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> This looks suspicious for the clock pin.
>>>
>>>> +				};
>>>> +
>>>> +				ws-pins {
>>>> +					pins =3D "gpio7";
>>>> +					function =3D "i2s1_ws";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> The same
>>>
>>>> +				};
>>>> +
>>>> +				data-pins {
>>>> +					pins =3D "gpio8", "gpio9";
>>>> +					function =3D "i2s1_data";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> And here.
>>=20
>> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
>> active config for these pins have "output-high;" set.
>>=20
>> And fwiw this pinctrl works fine at runtime for driving the speaker.
>
> I tried to find an answer.
>
> A doc for this SoC says that i2s clock pins should be at output-low
> (2 mA) when muxed to the i2s_xxx function, with no information about
> bias settings (perhaps bias-disable), and in sleep they should be the
> same (minus the drive strength note, but 2mA is the lowest setting)
>
> I am further confused because the output-enable bit in the cfg
> register specifically says "when in GPIO mode"

Thanks for checking.

What should we do here now? Follow what you found in the docs, or follow
what downstream is doing (8ma output-high)?

https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/d=
evicetree/+/refs/heads/int/15/fp4/qcom/lagoon-lpi.dtsi#219

I think apart from this question, this patchset should be ready to land.

Regards
Luca

p.s. I also briefly checked Google's repositories (which is the only
known place to have a commit history with devicetree since the
devicetree was just shipped with vendor/qcom/proprietary for everybody
else, without history) but there there's also no hint whether there's
any specific reason they deviate.
https://android.googlesource.com/kernel/msm-extra/devicetree/+log/refs/tags=
/android-11.0.0_r0.56/qcom/lagoon-lpi.dtsi

