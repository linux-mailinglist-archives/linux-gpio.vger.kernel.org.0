Return-Path: <linux-gpio+bounces-36873-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL3pI9E9BmqmggIAu9opvQ
	(envelope-from <linux-gpio+bounces-36873-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:25:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DB5547093
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8E853059020
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 21:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9190E3B7B91;
	Thu, 14 May 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pB1PvYyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BC/6aT81"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767BA3C2785
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793842; cv=none; b=mO2Q4xwsu1b6dP/kXHTwRDsawNwX0nQmDr0n929RQwzflr2JY7SErHuELQaC+vy1CA1rV07TbIyIgcsNADEp6+iKeM4jFIJ36dhyJh/CS9EKfGTgdCFIUArCu59uEBNribwveme7zCoNuUv7ljHKJRJlL6a/WlTKdc7r+6REX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793842; c=relaxed/simple;
	bh=Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYhmT2+PgkVMZ3V1sBElJ3/db4GJmOGZV+EwXTMCuNDmdPyNemuKgcJ+EOoqOh0b4m5vPWComliKrapnZCqWbGI8GS96H5bS27fGNApKHG3LSKhNnC12pfVfwDFNNqrUcT+ySa42svDeZMftR1gSlAXtWmamdZm8vOiyoRpvSlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pB1PvYyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BC/6aT81; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpOvx4008230
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 21:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=; b=pB1PvYyErK43eAPY
	8GRxW3u7AM7AHohNM0M3cHCMCNo1VwAlgiEmlPBRRhAH3qzvDhBijYNB8Mozuu1t
	A0lh6pes7yXko1c9nG+m9lUnW0Id2COTnlBJXuVbwlwJcKrTpdQyWe3r3T1io7Wj
	SjhPG5n4X8xvsENTS0CdPmtrRTaEQKdFIWa0HxwsCZDv1rMxb4234qxcRW5FPYMB
	6eFs8mtHEJekZQyzkcvtIws/TE/h1OvUe7QYba9+pcSqPKlYR/Ya1dKobZLgN1kS
	yEs0DqhocJ+ok1uVUHzxmQen9ZwP+lp1oWjuC5BaSko7GFzEEpB+JYeXEl2cRUyP
	AHWxDg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1srf6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 21:23:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f2d983d109so15903554eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 14:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778793838; x=1779398638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=;
        b=BC/6aT81v1IKW/jRwglaUTZ4VgJb2m3X6e9uWA651mOdjSw+TgBCXkCV7f96Pw1cVl
         wn6mSAxs4FEVjWeTtHXkzZtKjJV5huI2Zn7f+CDjCiriUFZLuPqDIG5YBVR5aldhMLXI
         ci/VRXNk3Utuwa2don0zO2DNcyJuF//bCB/n3OJc73fNuQJhS5wB95iVyekLwW1+Nd2d
         E6Uq5h+lRYDiFrhoqqChO++WST91KGaUC1AO5ucDI47A2hiC5JzpAM3B/iKZaXBSHwdc
         Qs5XTy4XIjQf/6X108DAOmE/gUwpHCQJ1bDiJkcL9Dl41ELCKjU07Fw/MmIY36QF3jML
         c/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793838; x=1779398638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=;
        b=pMB7cRgDlYiX/5pmYXMb9Z5Su5OxHWnIGD6yjcfG9O69uD0bkh2q0UX0+HxynVygdD
         ybIttWzHPWsK4jOXCu5n9KMhmpMrXsDbKGDhC/889aYT1gFHgzio7sHp6yx4/DjTkrZD
         C1Y5nIGr9bGPf94MsUELjtZfMrk1fgRiZY+hd9FmOSEZQlEF0n5tB1/QDO9d04CEIIMi
         P8fJio8lFJG6M1eW4o+RProXQlcweUfAXsMo+B2u7UJmGhDxwU89C/bhBuqVLiRDYIxC
         JP7aBZaF4FpHEyQ55bBlRGwex2fAH7n37z73YN6r2RXM2IcHLXOieg7c2/F14zhhvz6Z
         FAqg==
X-Forwarded-Encrypted: i=1; AFNElJ+ew4AJVyFZES+gaAHH3vsdEEMXHdWxCvGwUxUGLXG2tqcCNGX9LAm6hb6sSIg/aJZMyEferjEeeShH@vger.kernel.org
X-Gm-Message-State: AOJu0YyY0AkdFNlXQGTygifOTLCfjMtoUrw6HlYsFDLJGk7Pgwp70dy7
	nDtosVonh8Fd4PQhjjFmq3rWo33cQs7TEsXm84B67M8+dkkrw3JR13Iov3Pc5Y16NKkwmOywSS2
	3T0wlF5lZEPKQAIbEq+OfQfseZn29f31Orqq5RxpJQ30Iy1mnJh84Ay4yvtLcQbQm
X-Gm-Gg: Acq92OEzZfALVXToDoPX6bqjI/CGL2KK9L1/jtRqjoo00sYf/VLYPsLWKCZHyX2BVr8
	wwpxNz+0ACl1M3iEdfUubzv/xo80m9OU5QIiPajSmANbeZ/h7etrW0rhsEB5Fx6pmTUH/o3Mn2q
	QBKx22KsTF4zxgLp6WLGDGPmfuEOj8LuFnZu4zSyrCZonWG3GmF9kQYcpBJs1OE190N5GFp9sWI
	1bPQQ0xp57Fb0+kRlz/Asl+xrqrzeoXc0qAyeBcw2A5/HYZ+GGXMeKJv6F+CJ3eqo6gOBDS74gR
	BHKLxA+0Vje/8pGFA4ye7yW+27NvboVQYO8wgM0GCqD4N+2mB72785KodRwz80u0wlQjAqM9z+N
	+XOJEXZNXqx0uKUzemCAFY/CWOC4gpkPwZKa0eJx2G8tzYBtc1EwOriRxOzcBBa/imvIao8FmRl
	Fr
X-Received: by 2002:a05:7300:724f:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-30398189fa8mr789542eec.15.1778793838376;
        Thu, 14 May 2026 14:23:58 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-30398189fa8mr789513eec.15.1778793837795;
        Thu, 14 May 2026 14:23:57 -0700 (PDT)
Received: from [10.73.236.148] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302946f2149sm4468333eec.11.2026.05.14.14.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 14:23:57 -0700 (PDT)
Message-ID: <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:23:56 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jyoti Bhayana <jbhayana@google.com>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
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
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260514164422.0eba9a61@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NEoIosA-HQetPejCEMfKsEMonmesrTfd
X-Proofpoint-GUID: NEoIosA-HQetPejCEMfKsEMonmesrTfd
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a063d6f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yQWfTViADuQTjb5oKp4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIxMSBTYWx0ZWRfX09BZE32SBUll
 1K1fFvhLw4kS0LxTyYEz9kUCSDuNm+pWGzRBclwjBczqtrzqIj+6XGSrFyWvczZmRoV82WquDUT
 F9VPmSFUPWPrfVrrd90PKri0zE23YaShYGaw8tmrnk3UJo8F0+3hl649tLJUCJTacBdCV/RZNOz
 n/DiOUg/okOLIYNuQ1D8Y8HwOK2qA4MBJ6k3DOAQ+tGgjF9yiepwU0LPsZyGibfhdODHBDN+UB3
 YzvCa0gew83wZj2uEqfQnox6xRMwevpvh1UmD5ogMZuqm/bhmsBWsaIaO8q7tv/or/2LCUukoC+
 Enqf61dUy/PVFt4C5W8MiVySPYWRqWLcgo5ogtcNdd92ttuOYyDMaePx45LM2i8IP/2fZxBpWJ4
 o2B9fnQFYxAuznwoC2y0x0G1Eqa9wJDsxX3ynqsf8hSB5gstolwTGugbNMuB+tR9Y9F3tccTFHQ
 SPRZ8AntyuwTbVBDUiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140211
X-Rspamd-Queue-Id: E4DB5547093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-36873-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/2026 8:44 AM, Jonathan Cameron wrote:

> On Wed, 13 May 2026 10:16:53 -0700
> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
>
>> SCMI client drivers do not consistently log the number of supported
>> entities discovered from firmware. This information is useful during
>> debugging because it shows which domains or resources were exposed by
>> firmware during probe.
>>
>> Add logging of the number of supported entities to the SCMI cpufreq,
>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>> probe. This aligns these drivers with the existing logging in the SCMI
>> power and performance domain drivers.
>>
>> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> Hi Alex,
>
> Just curious but why +CC linux-iio and IIO folk?
>
> May be you had a false suggestion to add them from get maintainers.
> If so be sure to check it's suggestions make sense!
>
> Not to worry - we can all hit the delete button ;)
>
> Jonathan
Hi Jonathan,

Originally, there was another patch in this series to add the same functionality to scmi_iio probe but it was dropped. Apparently running b4 prep --auto-to-cc does not prune stale entries from the cover letter. Will manually remove all entries and rerun the command in the future.

Alex

