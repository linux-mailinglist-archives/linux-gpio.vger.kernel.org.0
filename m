Return-Path: <linux-gpio+bounces-25174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF84B3B346
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 08:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B26D7169BCE
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 06:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2978A2264CA;
	Fri, 29 Aug 2025 06:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGlrlaZy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8E30CD9F;
	Fri, 29 Aug 2025 06:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448490; cv=none; b=ScEoj55X8jTfrLD41n6yIsfJ8CRgOtzaqfopq3AA9ZZiycAgQPltGtvwspWur+AKw7+XwHVzEXYZyuzFMeJaWi98dn/1HzhWcCnaRS+DTAjKBQ/jkZY/GDvpvk7efdIhp2SkZwbCHP31b3BL4HF5DB6LesgktNSkRcpwCYaoJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448490; c=relaxed/simple;
	bh=xFsvfzrgNoRpMr9Z15ppUi0wkOKIZR9k1HX8ANNHk1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOLkeJuL4cAlqn0Kg2O/IImzFMk81mGqLfh3utVqEanP6fZKu2SElIUIcnGNCFL5lOWQn7OcWsPOzY274/OISFfGe8qCK8RwAa9K+Yw/eFqbhDaXDaWTYgBrq/QiE+DlAHMvDr7YF3WzZ4fw5ruPWzXztl3omSbzoZ1T1QkXUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGlrlaZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09DBC4CEF0;
	Fri, 29 Aug 2025 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756448490;
	bh=xFsvfzrgNoRpMr9Z15ppUi0wkOKIZR9k1HX8ANNHk1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FGlrlaZyBp0AcQze/fXNotB6j8FspsiYVJnEM4FviOuWNewI3t+6AIwR5LMbt6mTQ
	 Ira1Cj2302QBzQZjWuJuTzjYBVUnJs7vRV874SNIzhuau8HoFt78kLdVjpl4tjFdsk
	 sje7Ospx+n0DDHgceS1dUAsAUTSLO6sR9CQwbNlgt+s9MwIFkChdKwN8vbIM37qJCA
	 2m637kqPEtpU9zeHgkXvk8WXapstQmouN/1mJkA5SPvA2Z4Uuo4RBw+1i7RK8kYTEl
	 QSD6ljYKvf21RtcLf6F9gTikmEPOJ9dVCOISHOw460G4oWCiQdCC1pnu+swHOsSckR
	 MFmz/svkC2+wQ==
Message-ID: <3e0fb880-ef2a-482d-b008-9afcb46f9fec@kernel.org>
Date: Fri, 29 Aug 2025 08:21:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiDlm57lpI06IFtQQVRDSCAxLzNdIHBp?=
 =?UTF-8?Q?nctrl=3A_cix=3A_Add_pin-controller_support_for_sky1?=
To: Gary Yang <gary.yang@cixtech.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
 <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
 <PUZPR06MB5887BFF27AAD64ACA625126BEF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <5d8aa064-6dcf-40ce-9e73-feaebca06965@kernel.org>
 <PUZPR06MB5887436E03C17498E80E43C7EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <f54d43ca-87cc-40bb-a56b-e49ee6a0a441@kernel.org>
 <PUZPR06MB58879645FFBD2B7D2B7E9BE4EF3AA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PUZPR06MB58879645FFBD2B7D2B7E9BE4EF3AA@PUZPR06MB5887.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2025 06:33, Gary Yang wrote:
> Hi Krzysztof,
>>
>> On 28/08/2025 10:32, Gary Yang wrote:
>>> Hi Krzysztof,
>>>
>>>>
>>>> On 28/08/2025 08:44, Gary Yang wrote:
>>>>>>
>>>>>>> +     if (ret) {
>>>>>>> +             dev_err(&pdev->dev, "fail to probe dt
>>>>>>> + properties\n");
>>>>>>
>>>>>> You are printing same error twice. Drop this and just handle error
>>>>>> printing in sky1_pinctrl_probe_dt().
>>>>>> Especially that you now print errors on ENOMEM.
>>>>>>
>>>>>
>>>>> Sorry, this print message is only once, not twice, please give more
>>>>> information
>>>>
>>>> Trigger the error and check how many error messages you see. I see two.
>>>> You should know your code better than me...
>>>>
>>>
>>> There are two pin-controller on sky1. They share the same driver. The probe
>> is called twice.
>>>
>>> So we see the print message twice.
>>
>>
>> No, you don't really understand how this works. Test your code and its error
>> paths and you will see FOR ONE BIND more than one error message.
>> Plus my second comment which you completely ignored.
>>
>> I am sorry, but this is basic C.
>>
> 
> In order to trigger a error, we add a sentence in sky1_pinctrl_probe_dt() as follow:
> 
> static int sky1_pinctrl_probe_dt(struct platform_device *pdev,
>                                  struct sky1_pinctrl *spctl)
> {
> 
> +         return -ENODEV;
>           .......
> }
> 
> dmesg shows as following:
> 
> [    0.812780] /soc@0/pinctrl@4170000: Fixed dependency cycle(s) with /soc@0/pinctrl@4170000/hog-pins
> [    0.821920] sky1-pinctrl 4170000.pinctrl: fail to probe dt properties
> [    0.828503] /soc@0/pinctrl@16007000: Fixed dependency cycle(s) with /soc@0/pinctrl@16007000/hog-s5-pins
> [    0.838058] sky1-pinctrl 16007000.pinctrl: fail to probe dt properties
> 
> I don't see the error message twice per one. There are two pin-controller. One is /soc@0/pinctrl@4170000. Other is /soc@0/pinctrl@16007000.

And the next error case from sky1_pinctrl_probe_dt? ... and then the
next one? And another one?

Really, either you didn't read your own code or you just push the same
poor code, regardless of review, because you want it to get merged?

This will lead you nowhere.

You have:

+static int sky1_pinctrl_probe_dt(struct platform_device *pdev,
+				struct sky1_pinctrl *spctl)
...
+		if (!function)
+			return -ENOMEM;
...
+	if (ret) {
+		dev_err(&pdev->dev, "fail to probe dt properties\n");
+		return ret;
+	}

That's a clear NAK.

Then you have:

+		if (nfuncs == 0) {
+			dev_err(&pdev->dev, "no functions defined\n");
+			return -EINVAL;
...
+	if (ret) {
+		dev_err(&pdev->dev, "fail to probe dt properties\n");
+		return ret;
+	}

that's useless duplicated message. TWICE.

You could easily spot it yourself instead of keep bugging the reviewer
for such trivial stuff.

NAK, please remember to never waste reviewers time.

> 
> So you see the twice, once per one pin-controller. BTW as you suggested before, we will print the value of ret in the error message.
> 
> If I miss any information, please kindly remind me. Thanks

You still ignored my second comment.


Best regards,
Krzysztof

