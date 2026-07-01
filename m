Return-Path: <linux-gpio+bounces-39337-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m72sM9N2RWrCAgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39337-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 22:21:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8FA6F169A
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 22:21:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="VJMD/e9z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BZ13DhTp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39337-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39337-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05650302ED71
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 20:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E65372048;
	Wed,  1 Jul 2026 20:15:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA08395AE2
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 20:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936918; cv=none; b=istPC9SYO0dQLv7MJcisQt7AaOkiwY2xjNRAR7vmhBG6K291n83e0mFGLirANBfqkVgkNv8qO4Pod9/VH2kZg793Fc8lctoEVixBV4CIm1+Wt3kLWRrIYNoHstxRLpbTd9HF4ibRU4j8nizCWxDBC/ngLF/YdQ/QbeCOKjp3bVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936918; c=relaxed/simple;
	bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHO2hbqlMVj1fyBGibGBY6mcFBYjSIhYSpYydmTVB3rUfwG7VkOKXRaHDQGhsNzZ1J0uXi6Wbvc7QM0ZU4hISrkOY6kDkkm3RPiMlFWIdEj60/Sb6ENTYJ0m3rIq06K4gB3oIDJHrOaNkXuics8MkVdiEQtwxmODEGKz5wJeJS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJMD/e9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ13DhTp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmmMR1711707
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 20:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=; b=VJMD/e9z7HUThUD2
	L5GjT4qqw3dMF7M310mF7xsS6p0DOG5vuvctFE30BDECahkwx10QRUoRQ5EOfh8G
	Um2bGmtC0UxJx3Ep2kcZw9U72hmyDIcp0WtXq0U6eleoVFGubytVTqNSyOkPBpjJ
	TxOmt9KfIxnhpDoizQvnC/kr6hlp0+nOrPuMN8aUh17YUDL3tLvTzX6FwDYuIq22
	I28OIlygKKqLvsIGWWKPlRTb4skRNPPhofsOSWx0PAeWLppy93RqnXuZRdDIrswB
	jcWHyHZi2BHl/0PuMdK3rMuI+TFJIu2nGF7DoXehJRyH4eBFwdI0quB2/29l+SYY
	iPhylg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541seeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 20:15:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so1040183a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782936915; x=1783541715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
        b=BZ13DhTpB05mvoFmjf7dXjhhkN+iOSro341hQqAxxpje4t5ET985ZXYji+wkiaUXxQ
         aKtr16KYEWkxvSA0cPmW/R8cJJ39kZeTFjA5V70FeVQfB98g/zXx9Nb6VhKyO3YP760n
         5P+W7suInigpqjCpMeTiWrDnEBhBfPbTLr/pbA5Q2I6KvH4TZCnbjHqWIzzWqSGREMS0
         QJsXt2AfwKTFbZjwROV29ZlIkTSngKX81h0XJS8inZKcDDoOU0pl7JSz/i1cYlI5li45
         be1j5Z+8dAG64D1KiprClPzwrSRK0KY0Qm6+4EP+YXZ0OkyabUVw1r9G0MpOVROzH6o+
         LXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936915; x=1783541715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
        b=XEMjp/d5ml5gywSG+e1T/pWKlALeKZ76vU8e8i7WxERr8gZcvnI/8/HFBNKgClWz6e
         RwqSvGfULPmsaoKRog+sjx84WB3xnlKFLHtg0hoqKlPq6GtXKvo+uNuQiics8WnxTNmL
         HhcFGv824FxyZ4vQMNWjRc292aStpZaRSH0HvEi58IPw3D1BUxouSoIAeYZlNwpOUqKy
         e4MkV1opDrXGUG7YyzcPGDyGfZ/Z/bxGiJgP95DbjcQTFYWq1CVLiWXsRw/u6K4VxEye
         xJSFTT4cu9rPXplIIIHOQ7vhlnBVL71t/MGiDcfga0BQGbTSY8SEPnu21JPZbG+4AyFj
         mlPg==
X-Forwarded-Encrypted: i=1; AHgh+RoWAWO+4FWjDcdPiQUOUbuIquieQVxovZZD4VrxWzQi5A5i06Fz2WITm8+MY5yOOvaqgfyqd/YVadDL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XHdu15oDs/rMuO7BJHWxfmFwPuOu/GzEX2ngY/ikK1y3e7fD
	kv8Nut7vc8fz/F14SLZrPJ9tKQrtvV2o7Qb7b1H7fPRrBbyJXU/myqLljdQuq46HsFAnO6Z9chl
	t/AvNwgEFs86KfvNq1wjK6CFRxSm/cUqYwwK0TCBxAJyhZpx76/LavGrP8dngIuX699w1w2s5
X-Gm-Gg: AfdE7cmK5GxXgDJt87h9vg5vADIk6GUId1tsKBJ9A8ku1DlZCVL0qJMW+ogMQGjqFDY
	YGZ1hT0+LMfwx4v9OUK542TUXWceH+GwpqzS4qK6keqyk8gtsvPDngTKjSFr9s8bjqNdY2Ic8UQ
	0WAC1biew8Ce9Zmt3Zxd9CxoSySJETQUDl4pqFyJI6+C9rAQd+qbDjctwgvSmLbf7pZVr6seEZK
	cyv+63XF4xAdwhGh5RlbRGEJq9PQxnqRa9gge9uZSkLZ7mCZ7a45RzD6ctWIqIOb9QvvDHzeorP
	iWDun1EqAdZsIGSL01jPXhyuEzUd6dXlvW5sgjgGw2y2HM0zG3fulJlto6P8LAE37U83tPAeJ0Q
	bOP8a6EwqYaSbLjHmUng6c+icR6vj/cXXZr7Sfq6kcTGG+isxjMRt1ao=
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr6708435a91.15.1782936915336;
        Wed, 01 Jul 2026 13:15:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr6708381a91.15.1782936914545;
        Wed, 01 Jul 2026 13:15:14 -0700 (PDT)
Received: from [10.73.235.220] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc27e0dsm872064eec.27.2026.07.01.13.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 13:15:13 -0700 (PDT)
Message-ID: <50fa76ba-91a9-4bab-ae85-46f7a8a9f1ed@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:15:12 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Jyoti Bhayana <jbhayana@google.com>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
 <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
 <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KErFG6CECmg9ZqX2W_W-P8wsp2y8B-l1
X-Proofpoint-ORIG-GUID: KErFG6CECmg9ZqX2W_W-P8wsp2y8B-l1
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a457554 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vxRzfglfhILO5636UqgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX3gLc5iG03SBc
 GMf8KX3/ifL8rM/ZRpQbVAdMulzsFou7BnOigtLBCDpGwg862YsTkMd7q7n/ziFIgZ2mzrVu/So
 HGSFaFOu/1LCceUjqBAe7mRfduuytcGYAuToDw59O0kciWM3M27+44pn7Wu16gkVGeCCCgx+SgM
 rxsU9HkNMc2wldfxssB+TDr5+0VATP4krLw5n2NrCEHZbPaLBU6DpobKGxnDj4NbCRFddKCf5As
 GIVpWoY5cem8oofnPABYgttMD3gcUroimi9uWgl7TwAW7oBy3ak/hcPc+1+/FHHmIDkM+j37ETQ
 6LAF27E/ePfsYVb/RkktmRzvLyhsQ8vloV+dHrzdNEJ2JlKzHJem07DVXpm6cjEbIi9syNCVr2l
 7c5/KUhUM+OUoIKCKtf0g9DFj696BVyktQr8bAVtO0cG55DsFwg0nPCjtPJjN6RFduloc0jzjrf
 Hjj8XnZvIpfePgHtvag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfXzSQq/eS9kXBi
 mLBJmAnd0Vqb3V9By+q1z12OR0T1HtHB76bXhky0GtwrgguHJGuGdKMHYjGHiThABForWOSvORz
 alqf+GaOlcxS6HCKE/IM3lQUm4J2Mm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39337-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:jic23@kernel.org,m:jbhayana@google.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:cristian.marussi@arm.com,m:linusw@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:viresh.kumar@linaro.org,m:linux@roeck-us.net,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D8FA6F169A

On 5/15/2026 1:29 AM, Sudeep Holla wrote:

> On Thu, May 14, 2026 at 02:23:56PM -0700, Alex Tran wrote:
>> On 5/14/2026 8:44 AM, Jonathan Cameron wrote:
>>
>>> On Wed, 13 May 2026 10:16:53 -0700
>>> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
>>>
>>>> SCMI client drivers do not consistently log the number of supported
>>>> entities discovered from firmware. This information is useful during
>>>> debugging because it shows which domains or resources were exposed by
>>>> firmware during probe.
>>>>
>>>> Add logging of the number of supported entities to the SCMI cpufreq,
>>>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>>>> probe. This aligns these drivers with the existing logging in the SCMI
>>>> power and performance domain drivers.
>>>>
>>>> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>>> Hi Alex,
>>>
>>> Just curious but why +CC linux-iio and IIO folk?
>>>
>>> May be you had a false suggestion to add them from get maintainers.
>>> If so be sure to check it's suggestions make sense!
>>>
>>> Not to worry - we can all hit the delete button ;)
>>>
>>> Jonathan
>> Hi Jonathan,
>>
>> Originally, there was another patch in this series to add the same
>> functionality to scmi_iio probe but it was dropped. Apparently running b4
>> prep --auto-to-cc does not prune stale entries from the cover letter. Will
>> manually remove all entries and rerun the command in the future.
>>
> I guessed so, but why was it dropped ? I don't agree to adding them elsewhere
> just curious about why it was dropped in this case.
>
We could not determine whether to log the sensor count provided by SCMI or the number of sensors that were registered in probe since the driver appears to only support 3-axis accel and gyro sensors, skipping the rest.


