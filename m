Return-Path: <linux-gpio+bounces-32917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGT3IJoEsGlAegIAu9opvQ
	(envelope-from <linux-gpio+bounces-32917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:46:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F042424B846
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44DB1308DCEB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E8D40B6DF;
	Tue, 10 Mar 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHVsvD7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jfvx4gPB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC202D978B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142239; cv=none; b=BOv1jfT4n6luCqVqigE4c12RfX4Rc3C+xpiFRGRmTQvo6TAdiuBDBaNW6oUH6GQZiin/TJOdORsE60lc/AmZ3BlQS0qTM179V1VHEYE7noiEhMrZoS+I+PpPJ5D2WF1vG5JqwDCs7CNhgy6P+QsFEHohfgDpBCrZMS5SlFxzqcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142239; c=relaxed/simple;
	bh=rxSfCPu15s9VzoYntO5I4c0FGp6C+hu5eCM2/4zVLKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lJjDMA5x9ppdzox3wrq1D6HBRaPmpdqIIh01mwSadVJQl9EwWZZ0Sgo9+0/tjBHVZrkvEkEhIkUsOjOydwp48uS2Y/OrVzwe1aePIq+UUmT0tN0sEXq1NOLgxhxt4e1DX3V3ikx+JjyeVmDGLSnuD57+BO7Uh5CCh4/dZn/zZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHVsvD7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jfvx4gPB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AB4Q4x568739
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PH0gR2C2JBLuCyw+PmALJ00n0DdupIPY5smGuX3CWIM=; b=EHVsvD7JmhrZveu/
	5b28WrhGbBzqHPgiBYLRmP8NrdAodhfvCXM4Nago7nCO7Xbp75Vvkj3XadVLktPH
	2VzMKV8Z3IdDoBsfeXT/8qJhVPAukNBlmTYeteuCMczl8xvX2a/ThQT8W9SI/8ir
	NoPygLXu8W8Q5c037VaOUFFBikFDrFQW6RyqkC8MkIkshVW9/8L/KpMeHB6XhnPo
	gRI/syJ4YYymbOiqjLFWOHp3UkO/dDoi1ceUBqQkLn4wlR648i/8XQ6wuztwjd5Z
	cTeXIevKg5g0ZKRFHsBc+xy2/Cy3XjxkA71jnPik5C55UCw8Xie2UUX6e8fcJZJe
	olRAdg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h8r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:30:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a09f050feso4582326d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142236; x=1773747036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PH0gR2C2JBLuCyw+PmALJ00n0DdupIPY5smGuX3CWIM=;
        b=Jfvx4gPBYVAMPpA++jMlGzZJgGpilWewN1hUrR8BpZ/VHWM9EbaFP8Pvk2iMKuqNtD
         0m9vlWaXFzA/jUJ8nC2LyQsZzqL6tsOYibkPV0kDYz4FQIfs66435hdOCos93RQd2eUp
         N40MmLnasDON6F9CyuhiRe/6R09dJftY7qOD2ve6KF7kx4neYsnEfNaj3ZLjaeyQ+Kns
         HTshs1267xVzxz/pbgkCFJOIRXF3hiSj1EKBeWrWE/uUOE3kXB0skXb3QcSTxr+p8WJx
         FqzPlKApvLk5LitqxZP6dvbIzvC2kAF9oRsrybpEco+Q6l8CV/G6OMtYoWnWJiA5Byii
         gT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142236; x=1773747036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PH0gR2C2JBLuCyw+PmALJ00n0DdupIPY5smGuX3CWIM=;
        b=G796jqtgZ9wRIbepnnOgVuj9GkENaiunajwWBdFc2ZnWzc8PmkHqnNJxp05SZg/nMf
         LURJ+YBFsnuVm0yFiH3Rs/j8hLmESJJCkMb5Oi2YUMXec9goRSSkWr36gTODWpMzWfBS
         wcwldS4yVGXVMlTOikIERX4F8lrcUJAtAMyv64y5cGYj+m25/nrdk0rzZkkrL1oxP/F8
         Fx25oVu4su+UP+cTWBhCFrtU1QgewtIAMh+SZiQmnaaTYsBDjHRw8aysgTFHVZijF0wv
         +STJFsxLDxrdqtVGaryrjNyoIVPwBdt33guOeDdMsqKrI9GG9eFKt5JBC22MxLY74pUO
         pu7g==
X-Forwarded-Encrypted: i=1; AJvYcCX+09+z5cEnwcsqqLpZV/RzC0ve/Hg3yvELKaGAnE+gOuPLbf9fv2CtF/drxtZDmU8Nfpa7iMoKkopI@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzw3jS8CHTm/AvCNhBCGWZkkv9++X8vdlfFNzer63EVk7hzlu
	XD0vvfJvntERxPvzASwjTOFPqs+LCtG8mZY+yyQWUlLM70+2dtjzhGSB92lAPlmIns38zjoahHi
	gn4+YF82ni6kihYn+bbG9IBeguQLCNG2rhAyhlSMr5Kjzg15vfVv97RCd9Kc9f4hRyUErsbFu
X-Gm-Gg: ATEYQzx5HPc4NpwIJ51Oy2sYs9/NsNB3iNXrD+Y1+k+Sn+FtZGyVkDy/Djvmizdt5yY
	Ckbkow0510B8t4n9+v2AqaHJhsKRBGIJ0LXG8AW6HvUNuqOsB1Sg/rdlkrp5WmDR3e1dXZB6TcA
	XqpErjOqne07G6UCKpNNcRnuZmA34nBYHKNVlYbNhieRQDdmfWzXQFa3HHZRUQNsg6Yq5+ijf3k
	ENt8P8rXo2wBmsYaeJUNAe1xe/HSFjML34qqDyB89Z17Tb3p8SeG+mMQds86xNaG+8cF9yDxSPs
	Jn5FgLkQ52uoi1XozUcXuk8Kc7JSBDuLWfMOJtPH9/u3T32PRrGOZO2PrFNitQX+PCut3SQ+GV0
	c02Nx95fvbT3LE2dlHH8ehPfljzFXZ7gdSDXRQhSptXIyMdrRB15VPVnSxo7WKBnxT5mLxlF1iY
	RJsJw=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr441523285a.7.1773142236113;
        Tue, 10 Mar 2026 04:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr441517985a.7.1773142235620;
        Tue, 10 Mar 2026 04:30:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42ac6sm475964566b.11.2026.03.10.04.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:30:34 -0700 (PDT)
Message-ID: <3ecea1c4-cc2c-4a58-b62d-fbba2927fa54@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:30:32 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] pinctrl: qcom: add sdm670 lpi tlmm
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310012446.32226-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfX/b+vDC75DF7C
 3F+yX6jjzEFlDbZm2An56eUr8VHs91qUpLnTgYoicLLSVSD26xU/iTIaFWgNTzV9rI0OnYUcJJn
 qmLEk1tuf27UhVO+G/BOp8eUW7km3PBQlob/TB+2/HtHaQzdqSH8kuOjrRZPIiAgL1n4oj5Z8FM
 Btmzq1Aa2pfZ5NOVvsRYUE01KWogkykbtRFYmEzeJdPnMKnuzefoPQl3u9hM4K06/hOQnqOsT+b
 Q4tEu5oB4dYJHeBoJ23oQDz6rRzwont97eZreKsBMQtYvurJNeadE1R0+2pNbxrBUNR/Rn2lG7d
 z1X4b3O+d1e2MjxfKFC8uAzGIjZOxtC1zZV2ZYdFAdFyPNumdSehBmXjHlLckvWAgJIIHaSmzjU
 1Kxd3PNBfUWThuUU3mi7GlLY5aS2jotmb+9Re8nTviL7sKxn++hnyc+DkxcH1INP8FvnU+85ZpS
 KwHSzzoIeVvJv3ptbGQ==
X-Proofpoint-ORIG-GUID: Hga8tDR1Q_RgHxRrEX-T33LiqLcVEXbP
X-Proofpoint-GUID: Hga8tDR1Q_RgHxRrEX-T33LiqLcVEXbP
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b000dc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LBwg1sn3Q0AahYvMUeQA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100099
X-Rspamd-Queue-Id: F042424B846
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-32917-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:24 AM, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

