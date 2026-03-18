Return-Path: <linux-gpio+bounces-33737-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CAADCqQumnSXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33737-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:44:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E540E2BB02E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDB32300DD52
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0EA3CFF58;
	Wed, 18 Mar 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGUaYhA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DugqnDwI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970F3C6A58
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834273; cv=none; b=P8LNu5s3YxseFYfK6Ogi7wNOeMGMaGUYnbtIsOPD4TVmT7Aftnun3DaaEgSZEPK9evpx7fnKY7aUs2lt+ISnIDeZlJzNqhMOVy6xMAzR6vzvO1+9xKNlOtyePt84/nle3WvNkhpxmoNBJTIaXK+NSwCkGWRYOeqGFcdkrvPIJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834273; c=relaxed/simple;
	bh=9L28kowxIIemfNyOytDxHCf7inashgWwKKT2MHSuFb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXVQsgr6vF2LSN+qaNgDAx2uA207fq6khUHKJpzEZCkIxT8Ch4BXmNdZfxCZaMQCUASf8NJ8flEV0Q0AoY9oDEyXS1IbX4InfypF2yo8eMzIWdOkqtGSazvGIqFZXlnA41dUM7cchlSEEYjOfD7gtbUFhfr4flOOvRzG4VuUvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGUaYhA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DugqnDwI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I99HL22730161
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 11:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=; b=XGUaYhA8U74U/fH5
	H/XUwF9h+GQnBI/AAp3/r3Wh0KFhUZrOW3SsK6ZB3GkJCbzegUW7p3MbeiCRaa07
	Khxv+wEta4tK1q2D1/ZBXRWpUY/xWUx/SZh9/SLNgyxIW95JurUGvD6/B9Dc1JJS
	/0vwehpzjc85CQYRt08VgsmZPPsvJIA6Kdt5JfTRcYJ7UX/YiRxF6f4ySWPx8Ig0
	UJgJlFtL4JN/Gv7XqJseaJRrp7fzAp40WQ4CKNvTwQM+sT2PfKRVgxcdSvQ3dlLm
	PwZbUKdJ2aBUxdSf+xIz3xfvmRGn5RVHwzCa/Y0Waek0UQA2r9rRKMhmotVDSaYE
	vAaaaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvmv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 11:44:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509118781dcso79570251cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834271; x=1774439071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=;
        b=DugqnDwIfoWZJEqyxwcHzEZfTp0d252l9OWcxp1CUiUVoUbFId5YOElDTIUDwGZS6g
         Zw3wqnP+qr+V+B4AnFIiu6V9YUjvFj086YmPNC05G4w5kiLF84aBuLCAcAiuWIVtpwgp
         yvzNm1K2oGk3gWlie50YqFnqbbF3JECRMoJyMJcwZobZA0tbcLtMI1nOrG/FMpfY+KNG
         7wckDxnmKhVX3QOJ4m7MT+2Vc8dcAzpbjf4E0wIRzlU2/5RSCj+ilkS5KTgVHor9barv
         2qO4upva0kOJV/3dtZCiCLRD9FiyuRbtyRI+GStsC7FMcksiZAvnGb+TOoaZWpItTowy
         3I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834271; x=1774439071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=;
        b=BMp9i+YFzu7NpGWCgo26akiw9ONHKJ4O7vJLELckD92tb2EjjCTg2XprLgsjLltSAF
         kT1w+JCgs/aE6YW4pQsgpE5t/aAJDnl4/NDYdgTwhCA0HRFA3ZykYPY/WUeIq7pXYKE+
         3PmkStz8wOtUJvwpx9Dy3sqp5cckHkavmkIvYueXCEWpOgLVtPS/cZS8zxQyFQ3NX5iF
         tW0OarhQB3EQNOPnFINNVh2ljmeea33FY7b8MIzZPqNVYenzS7RHbTgEIU4YzMPRdEDl
         PtdDEvddP8OBxnjgXFMkazRb9sZPhs+kbw0um2LxPDo/sKAD+VDPEcSnTECYDChbzogk
         4Xzg==
X-Forwarded-Encrypted: i=1; AJvYcCWA6Gu2dRKyz67dza8d7MqHNsH5j2AYOlDMjXC+9EkIHkv5NOueMbXX5P6UEZakExwZ+lWsVhzm28Xk@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzjLH9OvPgFqtUGP9hxyOEPYlv64rAmJrFWjQBp3YVT2N2Koj
	TAw0tIyPzucosCvH5SxLnWhLV+bpoIBXwBJS6zif49JwrYxW7fkHDeP4MhIEE/zIPfqZ0UT1u2e
	0j2+1CCjoipDm//maly8yVx1uAMtGt11L1whAQ5RmQsbbTh+DnB5i7WTGHhxySi2n
X-Gm-Gg: ATEYQzzwCQ+KQINyHMWIbvjXtambiRD+NkxtmuIxVoZiUR30bKwpt7ftwKYlaLPTD+D
	4+Xl51fqon/lbYZom4ZHB5cR4d9U8knXDrvSuJwMKnXULxFrqoUbpx09ftOvqfkEqRg6CAsrg1Z
	jNLVrq62s1cr/lwcNorB7/HVHGZYJWNYfBocwtnYjNxVk4c0E7u7yNw22Visrqry3uospRrWNJk
	QM7f/BDiOFrcBXuyXz5WzPuzzLrh2PpLRMkqBndabrhGN44xadehsUlvXY+ZTZTz1+E6h1azRCM
	76An55nMaY1BGvVjtGom4aBgqhPRlvpyO1y3wSNSOSlEG02X/0PGGLYhBX0PgF4vAd+ZLQ3Mctz
	3EFYGVCs94hOuLk5Ogbh9qqKmQn2i95pwChc9cBTO5WCoKm/9JQD86l0+XrImi0BI/v3bjIiUye
	mqWfg=
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr28548401cf.0.1773834270540;
        Wed, 18 Mar 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr28548091cf.0.1773834270129;
        Wed, 18 Mar 2026 04:44:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e83c8sm187232666b.2.2026.03.18.04.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:44:29 -0700 (PDT)
Message-ID: <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:44:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
 <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfXxYbEcsuVHCY0
 YOuW7YsiRYj1WZhkwiO4td8+Ixj0jrReILqBQIXbKtzv2CbyRypP9gXiBC/QITYifBCRqTBD7o/
 b5mkJ/QrP3xubsi2cAIX6/+deTRfUMhA9ltEsXSqRe3z7O3mxVviyPEYFi+246BY5utWr685iLB
 rN1bPU4kc0E7r77cLRPJM/5L2U7+pwOl2/GLyU7+J+JmMmpqueEnuZAcV69F1zZZnaeQO/P2d5j
 n5Wq8hQ+oQvtHgYwLzca1SE0gL2RUktZVJmZjwdcXOOnMKvMiumeOct1bECDhkkaqWmL+dnhVE5
 et+liaVA3QCWoBNzkVyV6/ddHgWLflPlo7D5qRyVdycV/r0bISvh+avBrbSc9ihycu+JsVY5Yy4
 nw760xT8op4ryia0XJ4qkuzq67G5MrWN8Lhathre//1lB7SjrSmejMgAlLoN9YmmUhLjwK6acQq
 VxVMCrxHJXcCyMYXecQ==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba901f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Fu2ZoqZfox1az8yWQm0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3ZWqyCCgOBtaEFbSmj_XOqeHuB225d30
X-Proofpoint-GUID: 3ZWqyCCgOBtaEFbSmj_XOqeHuB225d30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33737-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,b120000:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E540E2BB02E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 9:39 AM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> rdp504 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +&sdhc {
> +	max-frequency = <192000000>;
> +	bus-width = <4>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	pinctrl-0 = <&sdhc_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

nit: Please keep a uniform \n before 'status', file-wide

[...]

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;

Since we have PSCI, is there some sort of cpuidle?

[...]

> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
> +			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
> +			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
> +			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */

let's drop these comments

[...]

> +		timer@b120000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0 0xb120000 0x0 0x1000>;

Please pad the address part of reg with leading zeroes to 8 hex digits
(i.e. 0x0b120000 etc.)

otherwise I think lgtm

Konrad

