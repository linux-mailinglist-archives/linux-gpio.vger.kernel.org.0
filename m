Return-Path: <linux-gpio+bounces-31450-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CagBiyGg2niowMAu9opvQ
	(envelope-from <linux-gpio+bounces-31450-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 18:47:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B22EB201
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 18:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA693093EAD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 17:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E188340A46;
	Wed,  4 Feb 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe75XLG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cz+WMRf/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB434BA3A
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226977; cv=none; b=uD9RFuXHmkfYTaDNAx+smBBaVmPDtuROW2A9oxoJgx6NtV1wux45cXpWjko7QBzysgheOhzWQP0nVYp/jznedlafYzyHHmkStalT7k1PSr/YxvL9svMiVici5Ns3A0ixt7tLrPd9bq2nUMFG/Llpt0vW2g2TDQqGRihmhyqXXFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226977; c=relaxed/simple;
	bh=rb9BQvsUgWnWi7NopoqFStPBl6AI4hwBSvA2JEwcNRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFRMQSZQWiRdLyggL5bryL28K82WY8dGhy9RccgQLPPakVafE0Gs6tpVwLLV+EkW4cFKOyTwCOZKnr1fB4znxpFFu5adQfCwkBQFyXDz0cCFoc6S4LNYOJae3+vS8bGSDMzZ3gaJU4ggzUQXvvkmGQCKdS2B9mbV5YdOd0RaWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe75XLG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cz+WMRf/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CISj2096170
	for <linux-gpio@vger.kernel.org>; Wed, 4 Feb 2026 17:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqNr53atLXa
	WJ6+VAAAHezxKZyJzO3XsCkWLFOW5Q/E=; b=Pe75XLG76TdFkS+VcQ+I/JpgGU8
	9B4KmyPIXVZUZVuTgXhryfY9GzeFjF/2SbsrsefJdnWA6Ac5pvWj7YaG8e+d4RFW
	EIrtENsffJSZ7LjEEzwioffMlXFbQyaDx7W3fzvpVVEFIygs7w5nHNo4EWHNjvZD
	o/6ri1gjAiOdI9taafAyq7Uj/9dYd+wm55G7nghJY12vOyVBB5IZL/flk7Km+Rel
	5UmzUKMbXsntprIMefJ9n0iQwiYo7gB9CvagTv9dORMq+mGmkQfERN9aD6Pgu1XR
	x30TIe7AO3J0O0VeZvlTsYqiRGhmg0q8ktVQCEoCTT8o+0xhNsw8Juun2Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44kbha4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 17:42:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so1882452285a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770226976; x=1770831776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqNr53atLXaWJ6+VAAAHezxKZyJzO3XsCkWLFOW5Q/E=;
        b=Cz+WMRf/afLcBB8JBXKfiJ19l8mC+1B/ah24y55/zco0rZJzfcb1X1+9A3iPzlSaQb
         h9dF8ftdzU1jtimsIsQ1WFbK+FZGdlk4FKYmJ4CFOBj96Syc0+YRbAr9g5IptGycl6eo
         SObFMvZDejJO7/bRpEiGHxdlMN8NXr+Rde4aDm4eU00m5QRmnbSErrpn82AgvG1Sz92s
         kq47qcNwuH03o/cHDs0zHbB5HZakqclZvoB/sgGW5kIsniShNnjf52DdNm1hjxG7SjrR
         +ZYCHhgkjWn6O6dD+du7O9lU4oQHVnvVveAdgJgrTeeEK0WNfEKrm6q4ZLCXUlOiiSIS
         AMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226976; x=1770831776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqNr53atLXaWJ6+VAAAHezxKZyJzO3XsCkWLFOW5Q/E=;
        b=wxPrztX9vU3ndNzPdWbveG5FH04Jie6SBfnjjQHCNanH7zZnfzbptkqA8YML0loKxU
         ktAAZVTFf/zzUyOI0LcFYdYdN9KjsIdau2FiqRM4RTTkhCPiiktiqFG644gWgJpCho4T
         4vAdrLzW9CNDIf/FIjewAUISnaCnL7U/PxPmb8SrJvHnXPrKiwAHZ2IDEi0gFwbmVklF
         WYQfdFcYNPjnIffczj96rsmE2v6DYvNqq1TJh5kRHw0KoH4iA+you29OmEOE3oM8FSMZ
         a02zoCZ9jDdydeL2LrDY1PRdP1oSHrX3u3AJ0CWrjVSSPLi5NqTTz1/uAQlnw4SQPGH6
         cXvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW96QdSEAli0vaxg5TUkaALYn1Up7UoCCBE22R8tuIjqTW/fFobPBRwo/pIh5KShL/1LsV0bjipZls8@vger.kernel.org
X-Gm-Message-State: AOJu0YwFyfcow+T7p/w5vXoLYjd5B6N1bXiytMv4uZbFYMAEdmkZY6r6
	IiXVdqfHQ64u083w8IxMNEH3Vzpvf+m5SnHnHnv6QWYBssEqRIS6z/crwDBdqNxY3HaqLWz119S
	bSxcNyaqV7UYc4X6QWkS5HfSjC9611rZJt043KlgL4eAjcJ3QpZVu0aZk+v6NPDf9
X-Gm-Gg: AZuq6aK7LEV/ejkUlBymvjcdxy4RgkDJYpWY3tu+e7cZ5D4+bM5B2Mg4l13F7a+eOk2
	SnP+0rmRpcCpiGW211hvx9M3bVYjEu3vCU069pPPEwGxgJxwrqKnhK+KwXGTmT++Wi9Jx8V0aqI
	mfi2awcgm1UCiNdG8q4YZHDZ8d33rscSfHigXAX1PLqHyzCAoQaxq/G6hxV27JrhiJ5A8iVFIbA
	5urYw+s4b/POYOZUoxy2BRZUtFmTGuijhTmu8yr8Sq8W/HKn6Bz6IF3PSe9waBccQKhS0hXGXlA
	/korPSivWB79LSO/57Vu+BBIokj/Px7HIn+6n/CY+WvXRVMKbB+SEBRv7Pzckdn/5bxUwfkfPcE
	tLJ6viMckP7wGqSompHIHQXrPd1XlWfCP5te0yswGzWQ=
X-Received: by 2002:a05:620a:2984:b0:8c7:d2b:b5b5 with SMTP id af79cd13be357-8ca2f9c067cmr507825185a.48.1770226975586;
        Wed, 04 Feb 2026 09:42:55 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:8c7:d2b:b5b5 with SMTP id af79cd13be357-8ca2f9c067cmr507822185a.48.1770226975126;
        Wed, 04 Feb 2026 09:42:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm959985e9.0.2026.02.04.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:42:54 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl
Date: Wed,  4 Feb 2026 12:42:37 -0500
Message-ID: <20260204174237.2906-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kEIB8O97tHJqYOumeJQVUESxKkCm1vyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX1/I9TV9f75S2
 WjR9YVbwLP8RufWaksbv9QcsvNiUPH7kr72b9cLs4EpnmXJKV3Z0eRd7Y9tiglKa9q4fk7x9/jW
 5yCdJKdivzHnPKfP9Qk9YTSnAHZTIvvpj19og3VYq4oI1cxsIhl6SULdkOwgoC46FiRXEd/8Foy
 zfIk8uzgphA8bUK1ksHiHSyXtChexZXNlJgfq8ayw6YpLDnYuQ81FB/QI6eMQxpCpfohy/LU1RI
 eqRG6KgNQ1uF/KyVBy1hCkzApg5xb/Hayfp9G8wFKo0QZtdMGDPvVG3CKi6cYqPVYyPiMxKGNod
 THlhWqmqIq/JVqMJ6kB3F2k9ArEreET+ZX7Gk/AX/xGwNnkT38TCBwsmfon8jqDTJnshM6J1iKr
 3ngEJ0G8d6jE6pK8m4foN2SdgZKoO5G0T9ta4Fyk9lfWwtM2OLPRAcxjCjn5q/rB+6SysvQrser
 yBhk5Iz32i+3i/k5zvQ==
X-Proofpoint-GUID: kEIB8O97tHJqYOumeJQVUESxKkCm1vyH
X-Authority-Analysis: v=2.4 cv=HN7O14tv c=1 sm=1 tr=0 ts=69838520 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UxGNenrRC82WP0KDhzIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31450-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3c40000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.52.125.128:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7B22EB201
X-Rspamd-Action: no action

Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
configs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..e1ea94d2f0f3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2866,6 +2867,21 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_tlmm: pinctrl@3440000 {
+			compatible = "qcom,qcs8300-lpass-lpi-pinctrl",
+					"qcom,sm8450-lpass-lpi-pinctrl";
+			reg = <0x0 0x03440000 0x0 0x20000>,
+			      <0x0 0x034D0000 0x0 0x10000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,qcs8300-lpass-ag-noc";
 			reg = <0x0 0x03c40000 0x0 0x17200>;
-- 
2.47.3


