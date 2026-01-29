Return-Path: <linux-gpio+bounces-31264-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEB7LDwbe2msBQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31264-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:33:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54483AD87F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C09133004DF1
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2CB37BE78;
	Thu, 29 Jan 2026 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nibbBz65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F437B41E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675576; cv=none; b=S2kgvv3oy6zptG3ZPUCP0gvGw8nTo9k3l/uLihtoX/2aSOaxx40kJ1bq9van4pHpWXFJOFjNfwL3hTE6K+4mRUrdwHd7BRIzw5dB65blWBubTQq82i59gsbyZKqfq1XIKlWkIlNbXkX/IT0XTwTPbNFfupR/naaqR22nxi7Hu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675576; c=relaxed/simple;
	bh=f1GxHtLA5dSfXy2NJ+XkS6cb4bnCDot1iUR59DpR9nI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hVgthqKInnlVNFKyZBez6ZoSV0ecNvWYSQq2SDVVCQnB+iD5NOnzqZgRvAryVcmnIGSKUyGDyAgChoHxRrNXE7Js2BjXnjmcP2w0zB9APopgZV1MHSHt5HEPS4v4VqXZb8E3yDZcFC17NirOagrkLyRb3ClLloCu1OsttwF5yQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nibbBz65; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b884a84e622so104370166b.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769675570; x=1770280370; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaxUdD0qwQbZkk4erIr/YJtf7yeY/WCaddsKbD6XYuw=;
        b=nibbBz656o83NmT6mrloXtlpnlyhz3DhmOQ8fConLPwk8TOVQukpZaFQaQU3JJZg2/
         UKkHK7gwneRZzHFW3P99sFMCngSpJEV7SbiePeMN4fwfGgrTlHggmni6DKUS2eGLdVF5
         KpDxwwgb8n9OuhEWwQ3KllJUX33AwiC90xms756MwU5ul+9o90R+wxHQP6D7CW+dvvDV
         9M6rliQV5lIbBakyN2pqk1yI/E7mfJ6cqGgANiJS+WuNxGwAo9aMpTe36l5lyzdgTnuF
         iKlOcSSEfpw5DNfVrssJo3sS/td1Xa3tRJjvtlmXVwdtVKTB7IqSjCljZP8V8E8aWKOz
         k73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675570; x=1770280370;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaxUdD0qwQbZkk4erIr/YJtf7yeY/WCaddsKbD6XYuw=;
        b=u9DSt7cRD0LQBA/VJywRvwh3csvog60E41ueNtjL1puCy2rjJtYBNsTf51HLwGOO/R
         ZyMtrTSE0JSuWGGNdn478Qe6KVYlg9+5gThKl0mz81YVqtU1HtHmCmQDXFXM/jm2irpG
         t7cAB1wNKJMXKE/i9lvr8eQbE4RsQ6yHE685C5TlKGVSlPdOzuE2qLOm9MWioDhkKQMs
         gZC2oXLf1vtanXLhZjVQ5Bq04Db02Qacb1OOo5DwgGvLMQ3G/O+9Mig2kmGjf1Zui18B
         +ePFTbJRqxXqqBHJ8mrUThed6E5GuAauSQLVxqbI8zCnP9ILKVdUrC4AfF/xad9wkUTk
         zzFw==
X-Forwarded-Encrypted: i=1; AJvYcCXuvoeV8NTTHADSuSQ5VfDpscI8DhxKu+jZmJxrKLxf1kwZPESPF5aKeQPK6VZjwinA9XG6Djqd6WjY@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNQ3ook+80vOhjx3zKVdAR5NPsGfFYkvm98tix16kM+i+G71D
	bTO449JyaM5k20p73utNoOA78kq4anMzfIB9p/esf6OQYNhrym2wzr3pPcdkpKYpfq8=
X-Gm-Gg: AZuq6aLDv9cGfCeFaJxKfvquToUZODRPaJdmPCn4o6f32osi4DYVcfqDgclRdSe3WLU
	hiiOL7jNng6hHhta/DuT/gYXTB5GmCQQq4vzQXumTI+kVHAn+xgxRkQBP3nQ/4gZwMQyWRlOr7+
	VXvXgg9ihXp+K45Z32BgKbSUsYUQZrWfbcqW2yghEWLLldbjpAZ/5YgjAt4G/2ZKACGzGjk6thr
	qHxwclbHm8mg6tN+OGq3P+teVogDQ6W6hxoBmlBQlTi1NRR6QJNtm1s7SETFMq9252Qv7xKkTgq
	D9wHqoB9iGpmrY7ykHo8hTfofYAJScceoIc4Nhp/DtaXnE1u9w9WUxRvoz2j+6l0oaVON9XdIBp
	ZJ6TSGyVr/u7hr9aUuhN2GHbk2xKEYndIhsTsK2V3TFLOl62VY0leAB6wERKqQTduO+u5WrzvMw
	02CrG+DWzsWUEReLrMh5CV43xFeOvXvC9jOAGNDD3pK94bwzIeYrQ1lJ3O
X-Received: by 2002:a17:906:c10d:b0:b84:2fe8:b5d8 with SMTP id a640c23a62f3a-b8dab2d6bb6mr578618466b.14.1769675569833;
        Thu, 29 Jan 2026 00:32:49 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm224977466b.38.2026.01.29.00.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 09:32:49 +0100
Message-Id: <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
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
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
In-Reply-To: <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31264-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,0.0.0.5:email]
X-Rspamd-Queue-Id: 54483AD87F
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 +++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 66 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/=
qcom/sm6350.dtsi
>> index 9f9b9f9af0da..b1fb6c812da7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>  			};
>>  		};
>> =20
>> +		lpass_tlmm: pinctrl@33c0000 {
>> +			compatible =3D "qcom,sm6350-lpass-lpi-pinctrl";
>> +			reg =3D <0x0 0x033c0000 0x0 0x20000>,
>> +			      <0x0 0x03550000 0x0 0x10000>;
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
>> +
>> +			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_=
NO>,
>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +			clock-names =3D "core",
>> +				      "audio";
>> +
>> +			i2s1_active: i2s1-active-state {
>> +				clk-pins {
>> +					pins =3D "gpio6";
>> +					function =3D "i2s1_clk";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> This looks suspicious for the clock pin.
>
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio7";
>> +					function =3D "i2s1_ws";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> The same
>
>> +				};
>> +
>> +				data-pins {
>> +					pins =3D "gpio8", "gpio9";
>> +					function =3D "i2s1_data";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> And here.

I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
active config for these pins have "output-high;" set.

And fwiw this pinctrl works fine at runtime for driving the speaker.

Regards
Luca

>
>> +				};
>> +			};
>> +
>> +			i2s1_sleep: i2s1-sleep-state {
>> +				clk-pins {
>> +					pins =3D "gpio6";
>> +					function =3D "i2s1_clk";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio7";
>> +					function =3D "i2s1_ws";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +
>> +				data-pins {
>> +					pins =3D "gpio8", "gpio9";
>> +					function =3D "i2s1_data";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +			};
>> +		};
>> +
>>  		gpu: gpu@3d00000 {
>>  			compatible =3D "qcom,adreno-619.0", "qcom,adreno";
>>  			reg =3D <0x0 0x03d00000 0x0 0x40000>,
>>=20
>> --=20
>> 2.52.0
>>=20


