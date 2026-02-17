Return-Path: <linux-gpio+bounces-31754-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFCxFV5nlGlFDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31754-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:04:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BB14C536
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6582307A9CF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3E435771D;
	Tue, 17 Feb 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nt89/vMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMfR/zxm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ABB358D2C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333244; cv=none; b=DYXiXSQ1Q5UQEDKynaqGWhrwUxgAfTbcpACmMdST1CCPWgF1tBiwi5fMQ00zfGr1zsXUfF1uwu3Cqdwid7RskLSC9jbOT+qeyO6enYsUq5dCTUjc9Duf3R0bMeNRixVBCAdLbPKYoqpAhwDGgpzy7VJZC+Gwub0HcC66+ZJ9RUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333244; c=relaxed/simple;
	bh=a3LA7KzDIpTO8bLxJ01/V5j/cFjtuX/mBy5cEZ+Zucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g5F4t2A98T2g/Ds8lfSU1ZfdYpFh12Ak1mu112MKW5JkW88zuI0aLq1htob2B34QJ2PdKwlmLTaL7kDrjUKkN0et3w53BLXQbDw40aV4Odu3Mr7lEY7FiaKMo+RkEjG/Sgs4MvWDtMNFZftTnylPxbyi7GaowDBnUnv9/nprJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nt89/vMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMfR/zxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8TOZG048843
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 13:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGC/qrkXvyvWHKZjs120xsFHsKRgVyYQCVDLXmAlXdc=; b=nt89/vMgDchtZL/z
	sPXyTzwQ8skhxBET7h/4qle+11mjrtq/bNt8XQ1aWHfMqw7feNOWQpOY4ZHA1x2B
	Yz6+Ic4bOLnBAeWINpX4Z4jUaBw62u55jUXTqcypdR4oSqXBwC8QnUKMN/CT4Vsj
	CNqjFl0yIaFgqGBxisnHfE2a36kPhpUlSAnCuJ6EMLjzWYWpwdaL9cEPcWbh0Fd5
	1eAqMBLHPjXHQlqIz4NHHk+vUYdmyAakv4DQ0IDRF/ckJec2PWKBpB2WiiJqtQ6c
	VjkzKVRYhe0JmXlA8SzNqSBRb535k1zn1HVqs6ZuGfUs1YNhd/TsoyOlHVNPo5HW
	/DUxCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82eh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 13:00:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb399597fbso265052985a.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 05:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333241; x=1771938041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGC/qrkXvyvWHKZjs120xsFHsKRgVyYQCVDLXmAlXdc=;
        b=QMfR/zxm7yCVsVfmiCWuC7IeU8Mc7Hk0qzE33r4CIEyyVy2apgBPqQGdK7w7cGlNfg
         1Cb2k/TDoI9mQsm5DHOBZeBvzu0cSaN93dbbribL4Nzxp6WWujv8J6SSH3ypqR/5BcCE
         Fe97fSwEHN6jEHfNGBnyO/eADLBDVrkfYOSAgSCWFl3yLzEQmx0PZSG1AbGljFq6Lsfe
         aZtr2qScpEJ2JBM0VR/33T9sr8va0Fu9vDKRMHdNZ98wsaI1Lp3KSt4AaLFMbapxtm50
         cLOEJdcCfJqBiFwWT+/R8E/IPEDtD3myGjz98BklGqBcETM5VMbusv0Ux9B36z8IExh8
         jtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333241; x=1771938041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGC/qrkXvyvWHKZjs120xsFHsKRgVyYQCVDLXmAlXdc=;
        b=LV6SZuB012ECr2l2/8F7TmXjhYXCpliXrlS4Z0rZIxFfXyIT6aTo59wSn8bR844Y2a
         6XyVqcUVKsQb1fJHaVbvHRJQ8Vq1pv1AoYt+lPBn9YLmouuXHlmk2OeqRtNvQuQqGTt1
         ag0/rx+SMQ2yfRZzpW15NxFX72qiXmgYFXCXdK7Kx36D6TV1ppb2BreeXsAUvgtei8fs
         1skAyzZkOsf5lo1VGI+VmAV9zbX0pkAFQWXxjlR8Ua2/uqL5AjY+VzO0i50n9Yo0iYL4
         jXpJFIDDyolC9gM44yzbX0b6OSwU4naFMUptdJX/WpF5mNNgXOHYFMExffRbwBwpmV8d
         1Cnw==
X-Forwarded-Encrypted: i=1; AJvYcCWLtbSJtfdDlsvZM6Ng5L6aLz/+AAPlRFOngLy5HMkzAAr60+dZj5c8OKa+DQcEoPzqlNCWCsFIphIV@vger.kernel.org
X-Gm-Message-State: AOJu0YwVDZkvs6caBYlIcEm5SIXYSZr5+FL6soROvb63GHixcKwjnDi3
	CeQZGFaihMpUfHgQcvmAlcx8YYhL9hovKkDD5vYb/uYoJFepyJY8SuZBIBJ5PHEDtZeUn5Ynt1J
	Z+x9d6RXhCbx6txfxUtjPHzSboXO4tZqALg7Hliz8roMAZ+aaTMOta1XrgDRzwHmWtFPOfof6
X-Gm-Gg: AZuq6aJNoTEzlYK2oK3VN/41U3czGnweKL8S1ckhYmMcKg02boHYgu1h9hmJ0XtM1UI
	6rZS88FZZAuNrXzCn+nAcbCfNE5ZdRdXSl6V7WwuvD7DAhLWZKSUx6AKU8xyZxZVViIrOSamEro
	xZL2qTEr2fjz2MfS5Xzs5S9P6TYmjfu7DIEajayEnYXfvXu9T9ARDKBYxqEpfOKJkV+lXaliJaZ
	U0sOqDPYbEbL6WR3coQPrP1a9PmpxhAT874RquVzBQBJaouWbJKF465KoXEWA+264Gat0lefXFo
	hcND0PU5fCecOQzucV/pqqcOmyWBo1ecLeTkPNCMZoNLwOVieiVKNaB8whUlgqv9Lqmi+WiOXEK
	zZAqld0idXHNjOI0W6girHJSifkfGmUJi38R0xfJNBsQ+yp8TR10oZcwlq8hoa19IA7Pk8QHvYf
	XNsnw=
X-Received: by 2002:a05:620a:318b:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb4084bae8mr1330434985a.4.1771333241007;
        Tue, 17 Feb 2026 05:00:41 -0800 (PST)
X-Received: by 2002:a05:620a:318b:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb4084bae8mr1330423385a.4.1771333239929;
        Tue, 17 Feb 2026 05:00:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76b2580sm345885466b.64.2026.02.17.05.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:00:39 -0800 (PST)
Message-ID: <b9bebfed-ad9f-4079-aaa7-7333df5bc946@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:00:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994667a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX8CPawlYo48MA
 XgPyFfbC5qR7wQhAhi3P6BCIVruNXD3kVZy7xmNFMxcbl0lb55MEIyL3Ift6MWQHPp2ELLG8QZA
 bRhiNNcc6kZO8pzlH9p4AyK8Oimc06FD4ElK+Gg7OaPBEK1aseP6uHOPB5/7j0TtV+sxA/T/Ivs
 TfGIZLvt67DR23KLXTOgweANypMEPi3nJZZAiTxz1zedJ0MZ/WJVabG0uBYVG9kUplrH+P2FTal
 lHQqpb58U5sJCWDaMzwVV9qDf3Bl96ar0b+vd/o3FjrP7Lrk5KFMRI5fElgWaYz8AKoZf0qgLDv
 Uv5irBEwIr9lofVYRR/jERizmtUpz4V5OC9XCTXZ6r81u2AwJAok2l9vhVIUqk9id9N6YAC79QX
 Aj+d0NyjNLCUmbSwQP1fr4PeZpIDzLGUcthweSpDisgMlUKWpcF/K3yi24tpWIJ18E0wNeTUmab
 300Ie3vigenCBgRv26A==
X-Proofpoint-GUID: d_n_A2vNj_WEKCjbfGbmiCfA4AHMkoI0
X-Proofpoint-ORIG-GUID: d_n_A2vNj_WEKCjbfGbmiCfA4AHMkoI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31754-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 159BB14C536
X-Rspamd-Action: no action

On 2/17/26 1:57 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

