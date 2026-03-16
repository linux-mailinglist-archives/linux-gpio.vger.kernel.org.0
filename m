Return-Path: <linux-gpio+bounces-33509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMFLNGDit2lDWwEAu9opvQ
	(envelope-from <linux-gpio+bounces-33509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 11:58:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1829858C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 11:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3DD2300C025
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE32390996;
	Mon, 16 Mar 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1EuqDqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6RB0rbL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04B1A9FB7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658716; cv=none; b=XVeLT5BsJ63nVZesqnhOT8O29+j/W4g/Y9w15ZneF4hYCzSknRBicvFDGDWrv6eyOU+pwKtmX8n7HGoOuIBDzyjTQriooUWk9avAh88bimdhi9ojVriEdNqnGoXaDJYaSU4iHkNKuvyFh3FTuuzzdzpDpARm2Xpz+etcPmZyKww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658716; c=relaxed/simple;
	bh=3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqq4d8Go1BuYQH5IPaBib0z3dhRo5uTXCU4HaK4XoEqOQ0OhC14nxo34WXzSFNHFBG57NUJ4K6nimKcVUvp4QgkxJfqmi8SgNH68NzZ0FAhzS8y81Osf3ud74rMoSGfLo7R0kIhnepDnRM1gD411bylQEfVS1Hm7mN6iVnQ99mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1EuqDqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6RB0rbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA47Kc3124594
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 10:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=; b=n1EuqDqUsnNLyT2n
	mp4eU06qOVxKTbUSTLZXtEOoT30hLYdu4+IXTG9duifStyq/O865gmauvlaf2ElC
	XGsxmrGftnKF9AhQFsVsi7I6OdMwUdim6+ujro2ekgfuDgi78E6XvhXqlI3pPR7e
	db/aejPz7ifI4F8ZgRhTxJdl0lotkchtb2zmSdIeV0+BmG8UaxgDBjQmSR8TQkWY
	TomVAfXiIUuZaS3clpT3KXOMfW6tysh6SjxZl4GFvSJ9+HD8IzDJuZHTM3jYKrfk
	S3I+ZtfriFIweDflDiDKjedSx63FXK7lJwkrWsTOlLvqXk6ewElTE9pcGL2fQcJ4
	qJousg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmg5da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 10:58:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8298150caddso3790353b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658714; x=1774263514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=;
        b=Q6RB0rbLvm5YoQRnt8MDyk1bQC6MKudW/8FUBeOJ8AauvNrMrZ5tFxjQMTPEjDbiM+
         Avj1dMRpz9nOxCSFutXI2yL8AnENX5b73Pr3sD3UKfqoqp3EzUSdqjyE3/ICq4OatouZ
         HDGYCYl9LuOjiIFS/Yv8FpiF8Uy442PX1AoQ9GAkkyxUbvs9MYOo3ShkNIvgV9n288Z1
         FAm2xnxgi9VtcbcwiDY0ipC2Lpw6uP4JFOUN0vSwN+SoJm8qb0QJdhUl+vjasgBV/UTJ
         bug5jEdQFol7Zb6tqdqUQg5CIzd/u/V3jqNEcq/h5uIWBkQik3Njs8UIzM6S1tg8UAts
         HK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658714; x=1774263514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=;
        b=RxKLEOT6nPpJA4AbmYd7MLAbJCvb2DXx6pnuajJ2vBzTdA03NvY0DtLCY8NJFkwe/y
         DHu2fiAuVvYFlvwKdgwVuTmplJWjREcVGuFn0ZOrcIGlejQwb0k4ifyyBbWpHu0MlAHM
         DWLz7Ok4DATa5QrN2/U5PDQhSeXNKFXivSIiizs4l86sHgMLnnS0ABj64c8Jlv+HpV63
         01T++8p5w90+pjpt19jx2V5bSN+eywMWU+86Y9tXeD/BrXibaQAEd/Fkt8jPV2vFGwu9
         Ts7gV9Li22JFfynmqXaPkqIiTdWwOQAmMDnEb6Y0P2WneDcqbV0+gwBUNv+8LpL5ikgj
         dyQw==
X-Forwarded-Encrypted: i=1; AJvYcCXJTFYcbjgeXbdZEPMZC6LrkOfY9P7eVj+hbYuzT0Tmc+hPOfiheI7s5zvZEEvuPbbhOlyQPT6ctNIj@vger.kernel.org
X-Gm-Message-State: AOJu0YybdtIz9BJzdpnfQkTcsW6u6JdemebRJgqa5J9EjR4A/i0fGbLu
	e1gG8HzeQbwOxZLgK0d3vl+7XT4VCXH1DnpEr8X5rDzuCOWcmBs3Fr90+GRFM6kxUiZxNmikVCp
	k2f3R222WZm6URwFPWgC8LH9EMn37yS1mREyvoBabIaWAQwQ77bfvXtYo4TDsSzbA
X-Gm-Gg: ATEYQzyE53bgbA9QnkUQozczRbSMwfIZBDxO1VFWGwsVoMGzZWWFeNs3Vdm4FmNjycx
	Hau2Or9J/dccLVRFO0EDPXB798Wyur31wGzVyFxU4WtW5T6G9uz6+elBR8ficVZgoCWOzim3pP3
	izGH/zsafrBhlYEW50zdknJhnCzHTQ3DQoeqtSWeJHgLAxDr1nrxRg+O7fWJ2EAcjt97yLkyGYk
	QZcL6ZIU/LCakcxabqs9ZbodigYx5fPx3rnWjqka0hQGZusBZDOk8FSqaZJKktZXUAWllP/2xzB
	iBPJH50BbaAPqOIsnVTdVKS6BN8B0jIVy1arvP5j0UxLaZovQJXwZQY0tf5SOQ/PgYa8LV8EPHo
	oL9JssDxXVvL/TMJwkyAdpaSxPl6Tt2Q1jZZ/gVBNYCWiOB2GdwOd6WV91eRVPag8iQ==
X-Received: by 2002:a05:6a00:908e:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82a1970830emr11249610b3a.16.1773658714582;
        Mon, 16 Mar 2026 03:58:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:908e:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82a1970830emr11249570b3a.16.1773658714102;
        Mon, 16 Mar 2026 03:58:34 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07366974sm13390277b3a.48.2026.03.16.03.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:58:33 -0700 (PDT)
Message-ID: <384f366f-b2b6-4bdc-a2a8-ba86714aa094@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:28:26 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
 <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
 <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX0z8N0/UdkIKc
 NfEpTg8NnwAUaG3A5PBqV3TDyPIO6QEk9DlVhg9TsQNAUN0AV+6yVfqYG519Wo2siJevdCQ31mL
 OV6VsoyV5aV/x7Ee41x7CNxt/q2NkthqTZIkaTv+C3Ag6O/r3vdx4rbWoymfnlEEjEnJfvYKwyI
 4/qtLsO6tdVAtLy+vC3fnqZ9lORxwJ1AUT0lEdqu8uga6R9se+dedRH+OkI2uSEDbC9YIghdZDj
 rsHKwoiTaVWqEvwezH3WBmyAOWmjXzK0JLUT9kf9NWS/Nfof+/Wer7VCZHSpD7Q3aGt5yLl+6Yv
 cGAMk/gLfqp0KUQRL3AMo+ZcnB4zHRQelPQLMlcb6QPC51gEt5IKGOEdpmQyO8SxWQ5OQ74qhVl
 6eF/pXtQVzCKVRmgi2m5flyikE+kaESrtevC7K9Kqb+FMP/H+AIltjvI3N7k2/If8Km/LUZRhRL
 0X5nWoDBtTmGvmhIeew==
X-Proofpoint-GUID: l2CF8UyfXKhFY0ZEh3o7Njug1Zt4eE91
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7e25b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=f6eOa__KeYMFnH1f_rcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: l2CF8UyfXKhFY0ZEh3o7Njug1Zt4eE91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33509-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73C1829858C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/16/2026 3:16 PM, Konrad Dybcio wrote:
> On 3/16/26 9:58 AM, Kathiravan Thirumoorthy wrote:
>> On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
>>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>>>> so add a driver for it.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +static const char *const Led00_groups[] = {
>>> odd uppercase
>>
>> Yeah,  in HW document also only this name has the uppercase. So I just left it to align with the HW document. Do you prefer to change it to lower case to maintain consistency?
> Yes, please - I would assume the original author had made a typo and
> didn't really intend to have a single random occurrence of an uppercase
> letter

Ack.

>
>>
>>>> +    "gpio23",
>>>> +};
>>>> +
>>>> +static const char *const led01_groups[] = {
>>>> +    "gpio39",
>>>> +};
>>>> +
>>>> +static const char *const led02_groups[] = {
>>>> +    "gpio6",
>>>> +};
>>> What do these 'ledN[012]' functions represent? Are they muxes for
>>> getting activity/status signals for eth/wlan ports?
>>
>> Yes, that's right. These LED functions used for the eth/wlan status.
> Can we better group them, e.g. into threes in 'led[012]' functions?
> (or whichever way they're coupled?)

Ack.

>
> Konrad

