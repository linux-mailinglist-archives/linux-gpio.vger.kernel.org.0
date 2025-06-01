Return-Path: <linux-gpio+bounces-20847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4EEAC9EC5
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 16:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20413B77DE
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0F61DF757;
	Sun,  1 Jun 2025 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eriQVstk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F238B;
	Sun,  1 Jun 2025 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748786739; cv=none; b=bKaJxPKywxOfP8uu93/3Bi9ebOakdAyOBaUbGL5I2nrSQYtGhT1YCO1Oyr4doXT/7MXtDQznGJoKUlw6SuLHkGnd5MZbh3xcssBDBNkzyhUMx1x3IZzSnqwkhpgS6kkET3XtckrDjylujtm6q/CD5kq6kjfQ2hpZbCyAXkkkRf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748786739; c=relaxed/simple;
	bh=WhfDJtq/dbYmES+d0rmtU87xA5m3o34KlR6tEJwZQcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DNZZmOUN5PbYE3uRrTd/Cdhaz2x6atl5K5XagTfLmlDBkmiqOmF57ZJrA/9EyBhXuZZUv7l2400AJwHzLnSdzkT+c28hmDlwjfVarSb5QSiUKkbMDJQTzUDojWjfsRuURueev0ZcGXOPGjPbDTAdJwsogQ9UOWlfFmIkT4ZBaWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eriQVstk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551CKuv7021873;
	Sun, 1 Jun 2025 14:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89x+R7zFivRRPUo2Mvk2FJglEWdtEImvfuYhqr094GY=; b=eriQVstkR2zn6XaG
	nJn9noUe4YFzsuVIHTrVcjZ6K0BGC17SwXiVh25JtETDH50rO8w3u11T9jjDQPq7
	4LSB77S4yOqCMWRjDfWWs/xGyxrYZfgJ2C4FLVF9IgCrFi5jygn4JMefaD5fEcza
	QDiDqHrnyqBXmz6YR0egF74k68w7EdF/UJihCkAqRXhdet4xMxmubZHkMrv+Fsig
	ENrQJ5oZ5KE4qlehyMN5yOgi4ilfHVyZBUWQMVNEnWL0InOylrS7Qu1SZEoU81jM
	e2+Fe83uHe4f+hQNmVb540NY5XyHKqkmOaLdPgbyndrRJZTHu7jTUlGVRhFZ0po1
	ag3iqQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytsdtctd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jun 2025 14:05:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 551E5Tl8023997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Jun 2025 14:05:29 GMT
Received: from [10.216.12.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Jun 2025
 06:02:02 -0700
Message-ID: <5b28e37d-6d46-472a-9aef-d2d86ea8f04b@quicinc.com>
Date: Sun, 1 Jun 2025 18:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jrGSH_MBfjAsi_PGH4R4kZtC8OiIsDQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDEyMSBTYWx0ZWRfX9VFzjqMRJEkP
 9d3497I3yqmx0Y56W0oeTCFtkU1rJZa4VNLK8lSjPMp76g7G5tWRdnVT2hYMmpHNd8xsLhWAKJI
 npLYb2GK6fgJdl6MuKUQilq+EEXbvKARfmZn561rdbsq7cV9D32wemtLI1ssYgpTw4GjAKssGzY
 o/6L2gKkH27PIgD5EHhML7Buh2lkoM+bb6KGiUOGz/j22v5ebFo/obejWN27RfX0OKQYTmC0bXY
 QZsQidSAqAqsXbu/fl4FOdTlclirOH6ZCnxQ9BfKJD5QA6BY0lOaUz+xq1GbsvWXTkZ/PAMyQjE
 HpOMu1KOYdUA9zSnRBF4tKP/8Q2q0/qrU1NA1ctWInHo0BA7eBu9fd2s4Og4McJdCXPGWlDsqEx
 +VXjdJ7DVo18YgYn2dF0iOeXGkTHf0Nb7AW5/h088iQVaWGdCqLzKzkxel05YaPy+68OQwYO
X-Proofpoint-GUID: jrGSH_MBfjAsi_PGH4R4kZtC8OiIsDQt
X-Authority-Analysis: v=2.4 cv=bYJrUPPB c=1 sm=1 tr=0 ts=683c5e2a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8
 a=COk6AnOGAAAA:8 a=qDtY4pz1xn7LEzqzeq8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=989 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010121



On 5/27/2025 7:47 PM, Alexey Klimov wrote:
> On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
>> The updates include adding the necessary audio device tree support and the required
>> dependencies.
> 
> Do you have topology file and mixers commands (or UCM profile) to test this?
> 
> I already asked but I don't see any replies. How this can be tested?

please use these below UCM config files
https://github.com/mohsRafi/alsa-ucm-conf/blob/qcs6490_qcm6490_hifi/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf

https://github.com/mohsRafi/alsa-ucm-conf/blob/qcs6490_qcm6490_hifi/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf

Thanks,
Prasad

> 
> Thanks,
> Alexey


