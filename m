Return-Path: <linux-gpio+bounces-35085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLFbEgrR3GmcWQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 13:18:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629B3EB2D1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 13:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A64530480BA
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEAD3BF677;
	Mon, 13 Apr 2026 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FttCNoqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sf3RTQjC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888273BF69E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776078834; cv=none; b=FBodzjNACQ3dU2lYOod70uQpevRNfjhSPMhNVhkIidV2gZuNOy9XaSrR+ChLVbmHy5I7NepK24KW/jZJ7wrXArHvssjbMOphe/wl78WUrTklGeGe1rasOhi8oqX56bWDLNYYp/DmAW2JmaxlTKsBT8fSFicOwFUYtfYdXe7v0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776078834; c=relaxed/simple;
	bh=NagDbT3niN1QaMnFYaHdChgoTXtW3KyAOUzQjEMkt7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVb3OmPCIIcVuuhXsLdmvdztx7A0IKDPXoQqzlxX5bCC0RH7vvx/+91SHaGB5+NZQL65NaWdHeNQuouCL8XyRt6jZhpa0tN1O4S7GsuKhxC7wL5g7h3stLnz9nVeJ2Xn6xP4HvVIvTyph8B9/eE39GyWqejc5aLqmx9pkbn+2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FttCNoqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sf3RTQjC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D602hf543317
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=; b=FttCNoqPV+itb35Z
	mfcL5AAIq/LCY7Xw+bBnFRY4EnbcWYDp8Q3RhW4YV35rOVVtqW0Reis3uGp20w2w
	VH/Z6/KxxNknEH7Yv3q61qZJja5PQSVhTWF9zwa7cuxiEwUXRJD1DiwJwUEGFVot
	XnmlNoFWRybWWzetHoaNGYa3NJnIfrXii/itUj3Nn+LAGiSwSqXD3NEYjb/rNFPr
	/nyGYjII2m0fGyz72hjl8bSUfyDvd8zZUkdJEAgEKMPOLx/sdUA7yDVAxQAup+nD
	+lhX5I5IlDrXwhpkleRuI736mAje9K4ri/nKPX9DGI4bCpf2YsBfeKtd2rLD16bN
	mQdzEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfw1p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:13:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so42796441cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776078832; x=1776683632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=;
        b=Sf3RTQjCA3VkIPuSt7sp8O3ey8SmsnIOyTSEGOt0PvEq8Ijd6vEpE3IY6DoJ14BfFN
         kE9g1W2hI97kjzS3FqEg7Mbiv/G9KztwflHEn9oO9ubnt7/77+m8sGgeHcMgJsMM39FS
         vQMb1sdkvt+c28rIvV7ZTPPmjKcdJH10mx0WXT55H6Geruo05rZLW0apHNZqBmVsdPJY
         8p4nO0YtPKnOmAqbXUpZb58R4AWR+I+frBhE6plrwvLiCEFpTIBKUTIpxr7TDImGC1JI
         gyrMDsGui28PnHekG3xiQMaeYqYbNl/kuIE1SF15+Q0RRzlJlASFfuqtOLndjCHrwtg+
         14zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776078832; x=1776683632;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMGTprsrYzJtBsOHJOoosmNqvDj+crbOe7chA++pxYk=;
        b=gjZD/hmH+Hrmm87u9xlQGj94RaJgSSbJ9GxwvluKY2whhW7hV3T0jn8FYlI0qCPtTe
         CrSTN19l5eNPPcR+5+KhiwMaLLsd6tg+0o/TjVSOYHVZ/KilxCCy27xwLwbpXGOvXH37
         EB4YWP7TpMcogJdzXoxDCEvoz/RTZJOUP4a/w6EqP6sHamHHc7F0UjQfbdchaNMUML/6
         HMwRs9iuLv2RC9TcDT8If2U4Ycf9CKnlRvP1M27ZCy09pPR2nC8F5gScWPdfEZ8iPDNB
         S4bJ99OtXY7PtvitotCPEl/JFl1jaiDUM4LinXXmYXdbBuEbsFPHyCMMnSx2RN/8ZUaP
         mvLA==
X-Gm-Message-State: AOJu0Yy3PBTRgnH3v6msCOxfOTwvCvGQaa2yAw27PCL2dcNFu+ewv6bb
	uLlqpHmJlXQpT/z/bubROigDvBIWb+wNwlOo130GDTXIC9UKWOZf+USsME4prt+tubL/Vb+4ZLb
	c1AhV03NLQpzC9kryyUQZGurekTorzHUrMKGjl3OEE3OaLeUic39g6EmD4QaFHgHw
X-Gm-Gg: AeBDiesfsxkSb3LPnQW0nABlVT5Sp1hrInwOLKRta4EMyBeihBIjnluRw8mUCb9BfhC
	Wh/uhmhhsxTS6nHpelEbCVc3wJwYLjzgXvOpv14sVpi2BZtHhSbSYf9wsnunsZthLNWAirn8Ldd
	oONFTpKv/IJ3LAKO3BtYeScsGv/M2U0TJsqYwtDf6ni0z/ZHyDPjlYfjuX+AxZ8JaGCDgRNHHWD
	DWm+UysgLOaOqtOELXbgXyicmmxFgqV1sjWhHtM4wn2jhehLQHWilEt71lQQtan5k2qU8B5rRCM
	GMegZN6mvPPDMeIP5KckDEfA7cF2PmYugOJ4E9gINzYPuy/MCVDt9nFOxQDEKJMnwWenzuwdrrP
	+aOIt5B3TF85a5XHxdPI8HC/3qkkA4BQVM9GpDvCmwISQPQ0M
X-Received: by 2002:a05:622a:a916:b0:50d:7f66:dca with SMTP id d75a77b69052e-50dd5baab7amr157673031cf.33.1776078831906;
        Mon, 13 Apr 2026 04:13:51 -0700 (PDT)
X-Received: by 2002:a05:622a:a916:b0:50d:7f66:dca with SMTP id d75a77b69052e-50dd5baab7amr157672681cf.33.1776078831464;
        Mon, 13 Apr 2026 04:13:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6ffd3880sm16502298f8f.7.2026.04.13.04.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:13:50 -0700 (PDT)
Message-ID: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:13:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        Linus Walleij <linusw@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
 <45866135c8a54e1d98cac51932ca8e1a@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <45866135c8a54e1d98cac51932ca8e1a@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1GbD4XTSqoV0vv_I8BnTqKFyJx-LkrbH
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dccff0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=c4pGgGm1PQYjHLslJMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: 1GbD4XTSqoV0vv_I8BnTqKFyJx-LkrbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMCBTYWx0ZWRfX4JDYuN3HWSq2
 EYuhj3pcEw7Zb+BAzPatfPxWZbZH3ELaVEfLMiEM/nwacJxNqz2doj6o6CT9zAiBNIxdYLXhmmV
 6YilJwvbT0ZcvV2L2GEtQHsqB9QFwoVeFH7gftm5ayEnWaXmrnfxT+lJASKACK2Whe9hcZSvBI8
 2vmCgCl5pZ4jXHTLUI1aHGO/UpCklPg/h3o4swcgH1tX/9eb1MNVKW0796HqS9N0LTlBpq1aeWb
 duOvWwZrRcta67dL96OEN2JSAydsq5sCdR8Yuz9lJpMZc/wlriI6N9Xy6ekIjDE0vVKWtf/86zK
 HR2p/Zbit8nNq4WapyOTmgkiYjf6DRbIYvqr5Tjax2vw8lwuVyv/wf8MFggCme4N4fhcM3PfHW5
 apatoEL7OmJM/FIBqDduj8xlRP4QOY8vEbvkt4R4VZkm2A9u3wN+xp2R1jWwBftFIiI/pYs4mWN
 fI9mYPBCuywDbLrhkDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-35085-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,realtek.com:email,glider.be:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9629B3EB2D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/04/2026 11:23, Yu-Chun Lin [林祐君] wrote:
>> No dedicated maintainers are shown for Realtek SoC pin controllers, except
>> pinctrl subsystem maintainer, which means reduced review and impression of
>> abandoned drivers.  Pin controller drivers are essential part of an SoC, so in
>> case of lack of dedicated entry at least cover it by the SoC platform
>> maintainers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> This patch should go via Realtek SoC maintainers, not pinctrl.
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10d12b51b1f6..374ce55e4fb6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3373,6 +3373,7 @@ F:
>> Documentation/devicetree/bindings/arm/realtek.yaml
>>  F:     arch/arm/boot/dts/realtek/
>>  F:     arch/arm/mach-realtek/
>>  F:     arch/arm64/boot/dts/realtek/
>> +F:     drivers/pinctrl/realtek/
>>
>>  ARM/RISC-V/RENESAS ARCHITECTURE
>>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> --
>> 2.51.0
> 
> Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>

So James will pick it up?

Best regards,
Krzysztof

