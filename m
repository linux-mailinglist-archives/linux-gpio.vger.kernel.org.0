Return-Path: <linux-gpio+bounces-12268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A515F9B3CA5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 22:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F16BB21B1E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 21:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25421E1C35;
	Mon, 28 Oct 2024 21:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V7D1P5K2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2A1D2796;
	Mon, 28 Oct 2024 21:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150920; cv=none; b=oWU8j28XfrI07tsA1Z9v9hhbzwU4VP6bl8ASAenlDTi9UtP0KomZXJuUtoD2Ijm2mom3rQHLc7+8CjUuFzrzTvtFgIB4xo4MUAuKzpfs9lJ2OU0YSh40TxtaICKp93TBIDu25xqHSMU8XrVWALl67Cx5j8pm3wxhMUm9soTdxmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150920; c=relaxed/simple;
	bh=pZl/OipmerZ/kw65LGJ1ltdtMT7Ev+2LBkbXBAg7OV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IS5DY8YF1uKHcO+StwZW+eHgZBOqjhq0hFE+DJMhkf+uFsSPHOSodJo51rC7Uty8YBuEvzHCpbuKeUgmz+hkvFXZWDfGMJOiIMlNZzf4JGNfaJ8JkqD8+I54Cu/hRtvF306tCJsxRT32WnZv0mekwtmXIajMTjGO07fnzycshwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V7D1P5K2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKC7NY004258;
	Mon, 28 Oct 2024 21:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zW9169RiM5OkNJr0FHvW3DYj/eA0YgE4Jk0bIKf0aWU=; b=V7D1P5K2nsgZPgN4
	VuH6qK5EHPV2i50a94LCyvARbHPCN030LsJQqLcf4iNSdfiuE6U2UpWkhPeFGrCR
	5bLZyJ35yn4Wd263ZnbfxhEg8xqERcDgMVlj5KVyIZgj2+JSKVAeZvoL+WsbIcnn
	EYxL3BUNd4a8My4icoJoNz7MQVbCyfxe4APUxyH9otiswKNj8oTB4QNeo/r5rddf
	Nr6Ve2ZP+cYh9D+mBGP2lLCZWQl17/A1eRGK9PY+vlxvBl0HOCTXbyHFNS+ujtyQ
	iYEkMP7KVV+kmvbWYvOUYeTaM01gDTU4KvYltDfEGhN5hmPoJdAgauqAy+FxCHL5
	15CJrg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgpa74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 21:28:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SLSVsT030155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 21:28:31 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 14:28:31 -0700
Message-ID: <b18028d1-43cc-4106-b33e-37480979eb97@quicinc.com>
Date: Mon, 28 Oct 2024 14:28:31 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sm8750 pinctrl driver
To: Linus Walleij <linus.walleij@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-3-quic_molvera@quicinc.com>
 <dnri3nqq2una3atjwl437ujzrl2txl2zdyb2ima5qeeudqotxn@5zdxizip6mhb>
 <d21b259a-1f04-4108-a201-254b44f07529@quicinc.com>
 <CACRpkdZX1qrMDR-6LuUtc0nqLK3MwrUYQm9bsRZL376Qj6x8XQ@mail.gmail.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <CACRpkdZX1qrMDR-6LuUtc0nqLK3MwrUYQm9bsRZL376Qj6x8XQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jkXGcmOrbVbYwJmEvCff4ihoOCp04txX
X-Proofpoint-GUID: jkXGcmOrbVbYwJmEvCff4ihoOCp04txX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=802 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280167



On 10/25/2024 1:43 AM, Linus Walleij wrote:
> On Wed, Oct 23, 2024 at 8:18 PM Melody Olvera <quic_molvera@quicinc.com> wrote:
>> On 10/22/2024 8:27 PM, Bjorn Andersson wrote:
>>> On Mon, Oct 21, 2024 at 04:04:14PM GMT, Melody Olvera wrote:
>>> [..]
>>>> +static const int sm8750_reserved_gpios[] = {
>>>> +    36, 37, 38, 39, 74, -1
>>> Any particular reason why these are not gpio-reserved-ranges in
>>> DeviceTree?
>>>
>> Not particularly; I wasn't sure whether or not to include in the initial
>> dt patch.
>> Will add.
> Can we also write (as a comment in the device tree) *why* they
> are reserved? Such as "used by BIOS/ACPI/secure world"?
> Just a minor nit but it's very helpful for newcomers reading the
> DTS.
>

For sure; yeah these are reserved for secure world, but I'll make note 
of that in the tree.

Thanks,
Melody

