Return-Path: <linux-gpio+bounces-36130-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB7KHK27+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36130-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:43:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2041C4C9FF8
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A68123071D83
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CDC330B15;
	Tue,  5 May 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsXfaXcJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8g++XIG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3050329C60
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973996; cv=none; b=pnuRoFN0NVCyiV2ERgmzwzJ8xK8Tf0nuChxBIRmifqiEqkU2kxvSnN/kkSlXby5ibMCD15JebnKAbQy+G1jrcWhHuR/mrQo9XlOqN4dV3e/zk2I3rEMy2gMRuO1NRfSbeqVUka/6xpOMJ4o61NPuOygfb0IBgShJGWerUDLwuEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973996; c=relaxed/simple;
	bh=Rl+wHEmlu21mwl4Ima9MuUQdF18jxNufUT09jYq4aYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q4yq0R9Cz/lv7nKCmO16FjSf9s9M+kAZXEys0Tyyz6dnnnMWHmB73vAP30rcY1IrDxaw6FL6nVlS4eT3H7RP/T0G6j2+igBcIhWQpawviXCxh99ISwpjhKQL2Gb3vVZMYijmTUCYKqWkScWKX2gs57ncw4dpShm9a89oKupzvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsXfaXcJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8g++XIG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VUJ52859242
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 09:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8zic9DE4k3Fd2ZpAy1+YrPHCcZMbDvgebYEBlVTRnRY=; b=RsXfaXcJAHe7l4fH
	XxeNN0ithguYDSYxWxvUuuYXVtHaRihgFhdJBY4ZV1P4erW2NkN39klQW4xWd5w0
	1qo+vOPwvMflvA6iYPuWGW2MlOMVL/H3y97/ZWHXwvUSBdqXnVpmu2hYzPQiKSnC
	UwLAxBYoABIJIn9RpugFmy6k6JuHKSD2dlxJ7RmL4ab6D15cieOpE/u4kP/kYgTF
	x2Nx8MUMPT7yPQ7H4Y3fWPlGPprL/qzGc00WCL5NiL+TaJ3wclCr/6laucKhXhmu
	TsYcjCJfqIe6bq8Q8jfaYOjDkTE2j2mGg895a1GfbOGAY76gC+9cFhlLY6o8NmPM
	VJZgug==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag14s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:39:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so422728e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777973993; x=1778578793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zic9DE4k3Fd2ZpAy1+YrPHCcZMbDvgebYEBlVTRnRY=;
        b=T8g++XIGufM2Q/Jd4eE98GZZsaOC1Nj3j9kQqfjMKw/wcepxr2+faCIZEjRRr2Jqs0
         0zoz5R3zMWqr38FzfBBv50x+5QyZuA+8p3kY56NqdY/wFtt07v8hRHoFUU35EYqwH5CI
         ur9CEge0fJf1u56ZooqOjhiT51Bgr7BWYw3RP+sOTEPE8tbTFhhOEZiasb3Gx68nU31p
         uNW4QSgGE/Ik2QexX6AcOKgcytkmzjeWYDrZhV2loxmEpEsQXAd/MBOBf5/umkyXm/JX
         GY+d5X02wPg0+3Q+4mN7XESzqrUt14VttTdeyKl5IYcp13zTEnhKFGfRPJCTKubeXOYg
         8q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777973993; x=1778578793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zic9DE4k3Fd2ZpAy1+YrPHCcZMbDvgebYEBlVTRnRY=;
        b=FAZo6cjXWu8z0ikGv1QLGbvf2u4ZzNZsEpU7CUY5jvBHTYMLrziGMgz1MS+UsPmcqg
         Og5Ih7Y69jqsdFvgEN6jTkuBu+eqAobgRclcBguPExF32FJeitbISnN0KeTx17w9wCFv
         gdF7g240ljji9rQCNNB4Rm1P79TQlPQAQpQoNVNXYhPgu8UHQVJaej8NCp54lZTorAPL
         QAsa7H0tYe34opY7+taNzHkRs52Wg1FTLiBxzUP99JqiF6Kh4JyJkCQ+FEip4H6Kwobe
         8R/V/jweUB1KuLtSQE6CCNFpfIuOHdtZ9de3/gsQiw9pr57XQJKJT0CK2bwpQMTnttw5
         LlSg==
X-Forwarded-Encrypted: i=1; AFNElJ+UFDHbvin41GGv/ShUWOd17YcZp2nAAfez0qYocUQPN2Uw+McpzX3TGGG3MXszEPKMw8rMHyynxjWz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8i7fpR0zq+XeOFi3hqIHB6elK9QwzRd2cOkT+6nx+fmQogEBp
	7Ud35K70ArpxY0ITgvL179narOQbRCvDGk7fKjkg4l3Q6m3l+TaLwfcTZFyG22bqJRMrgzIGFcE
	J9owC5HNYCgC/GHUpY7/So34r7IdrLI7YmL5v0dbL1yOKc2I4KBGLFj/vuRgDwnF1
X-Gm-Gg: AeBDievnt15Dll8TvQQgK5EHgvdha+DOeO3MPfIr8CNCnHusAn4paPiWjF3TWXrDxHL
	o1gaIBRx5HrbRcoImul/DHBmdP8UfpWSFr7Ho8miFd+vwPtNm1KA7M55xbqSX+KWdwx06RhRzuP
	0cCWR6gUVuiBe3z1YPjwdNBgzGoEgcNHyAQaVzk7bxUdmxA8DC2rrdgMliKIjnF5x4UVXy81LcK
	awAng1t6wZ3ilw4me0AOoY2PRSw/5xxlxbrngssM9SPXRU1vzKbkAFI6J3pKcQ4FM7XSxMS4qCx
	PqJKUU4q124aoACjzzNMOC7NLpj3PR40TKhpqrtbVAUTwED4+LJLf8OXDsNmiWAMzdMbO+nB7Xm
	GnmTrpYV2Qn3Vq/Xt65tWHiWVNLpUOdXhJh1ruKs5z52ge7d4wSZlUwg5ESyA96L3KpUGZFfSvH
	02JusT1lpvAvixng==
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr1559166e0c.1.1777973993208;
        Tue, 05 May 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr1559158e0c.1.1777973992781;
        Tue, 05 May 2026 02:39:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d66c90dsm477406066b.43.2026.05.05.02.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:39:51 -0700 (PDT)
Message-ID: <4003d6e9-df6c-4111-86b7-841a09c7352f@oss.qualcomm.com>
Date: Tue, 5 May 2026 11:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Move MODULE_DEVICE_TABLE next to the table
 itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4OCBTYWx0ZWRfX8wBPGjtGERS6
 5JLS2ovYYZW9Cc/zqwbvBIkxnk15Ge3riH6oCaAeal27KMcbbSjiRj50c5gUD+RDJ5eKytK1OzY
 37tF69CgMDcvgatduoXbNgojSGGvNOGxyXLX1ERDSfWnlGIJgBnjSf22UbWQMZeWeNqk4rDdeeb
 z/I7gvhEo8YhlxQQOqmnY3/8xBWL/brh5WixIG+Y2doYFV1cLHRkTSIAi+68eA/FdBlo6g5UHvl
 ZpA3ANdD8NDuZwc4Jio9KkDEVLZcSzBwqgcyucMMulEG0ZmlOFXI6OYtuGgllvZKeRH0LUMMOpj
 jSLc77nxDC8TM4N/wHM6yAGNpCBAOQEUWgXgG7EQC1/voqaSJSWPJPQumIWZU/d9UQXhxSzHv8V
 224oMHn8gxdMYD/Af50NgQa0pod01IG/zlwLxYlVoqq/ocAkgLOAERrmFcwJaI9G0jHHrhNCGEV
 Hwf9wJ6J2+zJPGI1Y7g==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9bae9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ccbR3Hf39A5eJIOqvTcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: AjZCeqMA4OLG7X4QYv2g-FuPSHV7NnZJ
X-Proofpoint-ORIG-GUID: AjZCeqMA4OLG7X4QYv2g-FuPSHV7NnZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050088
X-Rspamd-Queue-Id: 2041C4C9FF8
X-Rspamd-Action: no action
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36130-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 11:34 AM, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Some Qualcomm pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

