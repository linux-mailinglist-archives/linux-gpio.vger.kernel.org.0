Return-Path: <linux-gpio+bounces-35705-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD5sDyjB8GloYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35705-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:16:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D950F486BCB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 725BE310C684
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693094219E9;
	Tue, 28 Apr 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2m8hiP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dafZ0s3d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97E402BBC
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384107; cv=none; b=G8OQcTU2uqOd9v/ErhS2YUl+mkus4fZNUvt7Wzt/U/4yIpN/CHxceTL55NmGRt3OvLSHF+uu7/g0LIVkzKa+RjgVkxuoYAHM+ioHhMs1JgpZnvDE+wo/xhKQ09GK4yuDhNAOkIjvmAqCdLLhg5+ntNe3rLDWfea77VSUIb9sbh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384107; c=relaxed/simple;
	bh=Unp2Oiz/cs66vdAtRJtz9eeHDu3hXq//N9q9v4DFcFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+yoiAQedgsXpcF+n44B1gufd20G+lwdvjJWPlJuemAQvB1fcOKqTK6pjb6D/rLN8xXA7kaFS03CM5GH68Nc2vsf9Af6gm166HqKiBRvL5V2+ssU6vBmtiV/wwdB/F9FQDp5S7D5HRc6TuChvnvTEsTEJT8paY2q+B+qLKG3o1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2m8hiP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dafZ0s3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9rGLP2112409
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NLQj79Nh0vs9oijjdmLQJTZC6QHSqvF8XUATBuf3t8=; b=j2m8hiP+SC0WkJ66
	v/LMuGwxyZoB1kS3zv9A1b0tqESOUeXnK94hEgLn8HC7P01ktLal45lO8wezP64n
	S/ZmV9JtqlH+khQk68Thw2CXSrCdH2KE84OqMGFZQXojilXTTPYPVUOrFHC7FT15
	WWN3sJqaYGsbcMz0yrEG67kRqIDZc/im/IdKkmXnCB8YYIkvfFHp5AE0r2NCdzu5
	Qa5lfdXRM2kDcnwgMLxXCjSa/XkZ4SEn/b/7A0sK/98RhNk6fSfEyaesmGHoypV8
	fbAku8TdIX3EQ4UJDw4W9FzzKROSK+VwP87YNEsD6F9g0IS5lktzXo+xhGsiNmAb
	D9vd4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbku35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:48:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e2592ea3bso122155101cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777384104; x=1777988904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NLQj79Nh0vs9oijjdmLQJTZC6QHSqvF8XUATBuf3t8=;
        b=dafZ0s3df6aYkhPT03wh4N5o6NoXprLImO2BTegmlhbiLz7L5JkofsDq+Qgl1iFaQ6
         JhmxhzvVFjg1A/Fg4pZ9M4GLFNmBiRl1vGioRCsxULgZesh0pjyapY7y+9oPYEvXfj0h
         Kum/QmerzQFhZGd2sRX9CE9DZkHWYWDfMHxCo+TFWS3v3cZMT8eDRbpnZKYtk2L+LAJb
         V5gE/ebUsS+s7pE3IC0dn47KkcSDfcJRm72zz9LafqC2QRrckdcf16uQ9UYKAsMpg1Q+
         Ht47uO8xgAkfmhf6gjEMwM/UahNeDmlCOJ+AuJxjpKB+CqaC/3hpKAhSMAuXcVHBD9Ou
         iiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384104; x=1777988904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NLQj79Nh0vs9oijjdmLQJTZC6QHSqvF8XUATBuf3t8=;
        b=lLMvpUWRJ64oJvfHZjk7PFiStoN2cg285rhZSLFIYl3lWioV+6FvevzvzW/joAC0T7
         kslGq4eZA2whl/sJ93Qr/weEMTXYcNGXW0iWx/3vacYsJGbHSHy/TsNs/OLyLYppnC4j
         jb4HklWcJe8L+nGFDNeC02Tme4y9lkKULDJqwsU7zuo7E3SxL1LslZqW5gx8T1K1pvB1
         rMQRG0BO7kPkGXmfe+M+0hnRp7TD2Hlem/n/jU9QUEzS6XpwnG/JriAVFvGkOuZhsvSt
         GDh0Q6aOl3gKUw8gBRX64IL/ETr8dmj0P+JZ7SxrA0JlJowJNlAdMn4PifbZ0EAS1/Nu
         Vsvw==
X-Forwarded-Encrypted: i=1; AFNElJ8RIZQ2+kNkvoP5/KtGRw3J/IcFEhtBfL7FdctILth+qOYWWm1xgyWPixaOhP3oFeTCKfz2AyoHmqi5@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrjTIg48GqmeCxfZWTrLr1KIAmGc3Ae+rIQddzt2M6Ncl2cMH
	6T93AjtPKgawq0GUWBv0V8JbREm41A3DMtttfklC+8jl483RnaJG9iLk2zvk8y6FbdfgDN+/5OW
	SnhpRzdHtRBSnnmYUlgZBHWBmzM4Xd3b/ZRn3PTBFqryaIZHk+gLmNluEyje+77ms/enli8bZ
X-Gm-Gg: AeBDies+VfthpsSpNwUSEtmxHeSX4Eq2NhHEK69quNlw7GX32R5qal6QN+EkZxEeP/N
	uuIgO/dCSBPNfy9XKomDGHd3djggp9YwE7rfy/wseyqBnZQVgevk0BR+pTISuI/1Qi/s86I7sOu
	fK14eMNc5NIeWQ0fnpPhLBK8BgXowpGlcsH977gNOowWmqgIzPY84ogE99/1S4kekb21MBAf19o
	ER2UPYV/R260Tcerm+bi2UMKlsAPOvp5hmj7ZX4luf+SwusM7Y7h1B66KgceN1ExfZ0WEpLYdr3
	xvgm+RLm9yO1VKnjJRHVAigFNG7EOVXX1n7hW9O8PLDEGwwPKua3eEJdgsDMK63zjlPe/k9UQpG
	s7O/TPGx3VklLs2j/odOAAyAt+7IQRW1CjMUXFU1Xg5kofkQIPiBNyLoKYJUI8g==
X-Received: by 2002:a05:622a:1792:b0:50f:b465:94b2 with SMTP id d75a77b69052e-5100e1a9028mr41098901cf.28.1777384103529;
        Tue, 28 Apr 2026 06:48:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1792:b0:50f:b465:94b2 with SMTP id d75a77b69052e-5100e1a9028mr41098061cf.28.1777384102842;
        Tue, 28 Apr 2026 06:48:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9092:2841:2b44:da7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f2a2sm6716518f8f.10.2026.04.28.06.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:48:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:48:10 +0200
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: describe the Qualcomm
 nord-tlmm
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-nord-tlmm-v3-1-f16f08d084cc@oss.qualcomm.com>
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
In-Reply-To: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6015;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Unp2Oiz/cs66vdAtRJtz9eeHDu3hXq//N9q9v4DFcFc=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGnwuqHIyLpIGfDMBG3mkhweB+YEeUjepXmiYFKC722SLYHCw
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJp8LqhAAoJEAWdLsv/NoTDW8cQAIN4
 KcAgo3i/lf1Kh7jmIfxK/5+zS8lRrWRtJxMAaASQ1gSWLMUs9UvSEwBQRRk1TlFpf5jXqP2gxRk
 1Yxj7Pt7UNjkNUiEPeyreyYk/Dvd6ROVd1I4K/AMewThjpjSu4yz4bVdj0aGRbRqBvgBxbJ7+jU
 c3fK6LogQomVNqkLwcDw8Lr9d/i8KcmZKA/ap86MzXfltS7wYwtZohUT22DJSpoTV2j1pPqNxFs
 X3kURjI3NEM/4FF7jXoXl3kBSJjlMe0l1wfPzDE+7C4y2Y7yIT4I8gqsE9niewW/1cHxfJEu0xB
 Jtz1oFGuyp1BS6LaYn5uhZy5C/JhdwUvR+sAvPdaoXhjzhcc2d5+rgaxIkNKY/wfs+Wez7qvMmI
 +sZhE08JyLGAgbHJt/F5IFtGa7IaxVBECRL3ZvbG33ewE5IlqDfk1vWuu6U/6ULBq/a9rBeSPDp
 udxoyrhLj+TN47r5vIhcXJtdJlbJtvYnG/+bWkdjBh3DS6H3S38TzSWDgWCxbFDkMOx7ljuFP7k
 DCLuw/ft87tHu1gzsJ6Zyqc1jdMkqmCg4iPEqJFsEw8G3euGvHMnPEZAEX6QaE77olGTzzPnqTk
 YAEW+1kySdMHdNsJ9pikmWq4HaP6l5iFT7Rsa5CJqV5Gip9bD6TpyMi5eL6MMfiwFkv2lMPLEu+
 WmJKU
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: EysjtRaeQospW-67tOIqjmtikVQXnbQ6
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0baa8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ou3KgfM3KP2cLz_BwJkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: EysjtRaeQospW-67tOIqjmtikVQXnbQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzMCBTYWx0ZWRfX0O3DVXC16m27
 /33gqFp+CAO0A4i3CrBhaAJ7zXy8tfn58elGiA6ak9k6EfmFEHzFDzVrAn3Z4CpEDb9Cdpiw/0S
 R0CPY3cKRfSNAfvjseJq7KkIdFEwHZlMySf6D4+yjO7hGV4g7EmUX3mfAYn2/Fp5sdrmwyxb4nV
 WQUapJOCeNzQBpjGi7GuBhIv9gBmMdbjDFa4iVSdo/EIvyYl3kSrwbZ0MEBjb2zOX0ACy67zvGC
 NtjNlfoMIKyuWrFkkd7RZx+0OPFWFsOfiT4epCPcVXqyYgzVfH4UaLoWjubBffRI9h3f5hVu3oA
 UwEFmLfeONw5nRbjHhtmnu8HB6oQmbm+r3OSjzr4cQWaP8E7NVR9bL72qcC+sA/t+9ock0sW5r5
 ghqJVObd/2eLsMc51YAwskbgfDuWFIgB5DV3WjaPUFjcrpXPhH3f03XqY/NyO02ePVPl6HYWKOv
 xbZSqnTkpz2PTp9HWVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280130
X-Rspamd-Queue-Id: D950F486BCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35705-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a DT binding document describing the TLMM pin controller available
on the Nord platforms from Qualcomm.

Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,nord-tlmm.yaml           | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4bb511719f3130fc208011b4a8b45f4cfcde8c9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA8797P TLMM block
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SA8797P SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,nord-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 181
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-nord-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-nord-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-nord-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180)$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ aoss_cti, atest_char, atest_usb20, atest_usb21,
+                aud_intfc0_clk, aud_intfc0_data, aud_intfc0_ws,
+                aud_intfc10_clk, aud_intfc10_data, aud_intfc10_ws,
+                aud_intfc1_clk, aud_intfc1_data, aud_intfc1_ws,
+                aud_intfc2_clk, aud_intfc2_data, aud_intfc2_ws,
+                aud_intfc3_clk, aud_intfc3_data, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data, aud_intfc4_ws,
+                aud_intfc5_clk, aud_intfc5_data, aud_intfc5_ws,
+                aud_intfc6_clk, aud_intfc6_data, aud_intfc6_ws,
+                aud_intfc7_clk, aud_intfc7_data, aud_intfc7_ws,
+                aud_intfc8_clk, aud_intfc8_data, aud_intfc8_ws,
+                aud_intfc9_clk, aud_intfc9_data, aud_intfc9_ws,
+                aud_mclk0_mira, aud_mclk0_mirb, aud_mclk1_mira, aud_mclk1_mirb,
+                aud_mclk2_mira, aud_mclk2_mirb, aud_refclk0, aud_refclk1,
+                bist_done, ccu_async_in, ccu_i2c_scl, ccu_i2c_sda, ccu_timer,
+                clink_debug, dbg_out, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
+                ddr_pxi, dp_rx0, dp_rx00, dp_rx01, dp_rx0_mute, dp_rx1, dp_rx10,
+                dp_rx11, dp_rx1_mute,
+                edp0_hot, edp0_lcd, edp1_hot, edp1_lcd, edp2_hot, edp2_lcd,
+                edp3_hot, edp3_lcd,
+                emac0_mcg, emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg,
+                emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync_s,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n,
+                pcie3_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
+                prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti, qspi,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
+                qup1_se0, qup1_se1, qup1_se3, qup1_se2, qup1_se4, qup1_se5,
+                qup1_se6, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4,
+                qup2_se5, qup2_se6,
+                sailss_ospi, sdc4_clk, sdc4_cmd, sdc4_data, smb_alert,
+                smb_alert_n, smb_clk, smb_dat, tb_trig_sdc4, tmess_prng0,
+                tmess_prng1, tsc_timer, tsense_pwm, usb0_hs,
+                usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs, usxgmii0_phy,
+                usxgmii1_phy, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,nord-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+            pins = "gpio147", "gpio148";
+            function = "qup2_se2";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.47.3


