Return-Path: <linux-gpio+bounces-39976-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mLT5LFzYVGr7fgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39976-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:21:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353A74AE23
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:21:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R1NtvZHR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gZj75XqA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39976-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39976-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6073C3032344
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777583EB0E1;
	Mon, 13 Jul 2026 12:15:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C355409298
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944950; cv=none; b=ps8SucRsr5ve3Tfncw51ac4tZjyhWiEBjbcn9HKa/a948Z7GLeGdBWJPF400HpbDSjxEUKTVTh7Hr/lGnS5ygG5XMk8GDLI0RkWA9tOD3tnFC9DvybBPzLwkdw6VCa64c7c/7hAX9/qGjNsHhwWCneGIILV6obj7plidXR+TviE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944950; c=relaxed/simple;
	bh=Idmip/nOu5noW8nkQdg4s/Q7R9FjoaKZkmQtwHukCcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MihR848Ayi7haCyeWzJTeHLfuSC04Ja8ao+Bm5XO8c3OK7gz0NMRr3DGDEtIXaPy8qPxAFQl+HVxqsIUB4GTsebi9MIYkO3xOshr54/7YggwN42v5IdfsDtZ68QJATlPlnAbzpaEvgwywgBN3H2r3bzG6iLGTj6ZGT9MDG0pXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1NtvZHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZj75XqA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE0Mk1210044
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wqxzQNuOSLpI4zoQgw9QEO
	mxgTQJ9nfCSI9GvtFZtCY=; b=R1NtvZHRN2zBl+YO+eLtZ2AFgLjLSMON6Rtoxn
	J2vHGn0nyaNu4n748w+J0ZRghA8LNGoAp1+BUgL3unYQPX0xXHFYvpMMc+IKfgBJ
	x+GwJ5Y0nvTRyUoLHRsoNVn8+Srqm48jv/ssgNl0SP1uUAVNIC/GM3Ep8p1UDKxn
	3m8Etn+6lnnfyWQEz6O7WMYcKfvAZsZysLOy650G8B9ziFny/uEkEbKbnvKv0MzG
	+hOtUbCm2jFOx0r2xT50sj6VEAW/Bx763l8iOhFbp5+t/dd3CRWncpFfqinXrkdq
	r/rx7dfY4/EybFFrtAvIw+b/WlzyL0TY22CnfFGFNEuTVtJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrn91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso4845695a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944940; x=1784549740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqxzQNuOSLpI4zoQgw9QEOmxgTQJ9nfCSI9GvtFZtCY=;
        b=gZj75XqAoJ8eLfwsEHoeSAITHzdey7i057jnjhZFrCtk8AzfdnWpK5VTTnITk0ombb
         p2b2Lmj2ypD7XuwreGdCmCdPFdyvB52nsiMkrG7oXWM/KnDVC866kNDcfQJ3MbIi139t
         5cIPG6g8Lr0MReThAztio0bldmwVUUamDSGormNhxHFIhpz1hPaz0I4lqlvFBFj0DqrW
         kEOd+OON9989uo9e3cvC1juhGKJGSHoFLbO0qOa4cNK09ErnJkkuPe5H6R3c9DEYwJQq
         JJDi9+iwOnHwRD00to20K5QoYXt/QUj/aZmfm/cGJNNcJMCTr8gr/DYXD3XRmZo0MSiz
         TCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944940; x=1784549740;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqxzQNuOSLpI4zoQgw9QEOmxgTQJ9nfCSI9GvtFZtCY=;
        b=HYVUNINQ7B4NQ7iaYAmTnGL0c/J6V7SQueya8kvZJpm6i4r+0Q6sEG3UKatktBfQgN
         bSfs2Jbh28URWbiKOT0+8sxxU4GO3ndZzicqG+u4oc7vrC2pFeHxVxMC8Jh7NBXsFUqU
         IqG0oYtr5bMj7od7YdsKpEtRLv1Hxq7I/71C0eL1a7LzFO/TrVjEEAF9jD1Vh13VjMlw
         HHSEfAOACCUsaOjdEexQKbLoNIwN0tnTD+v7stCntm3HDr7NCTZ8OijyVCtHOri7MaZT
         SvBOoa1eU8Y2MsqRUZXVNNuYB0/wzfSC7JnW7DxfHaGWZcg1osaHcmKMTFNzv3//Mdzp
         Zd5g==
X-Forwarded-Encrypted: i=1; AHgh+Rphnzvp1+SEQab2zaou6EIR5sn/RiN7w/GiFyr1hM/B/sj7cnKx20BqDq4wyVbTVWqmunkb1R55LPyp@vger.kernel.org
X-Gm-Message-State: AOJu0YwYoJrnsba2NyH6wtBKzi44igO5Ma5h2uWAGnvaalKH4CYbl7IO
	ZsCKbF57W1Xyu23YxVq0Po3ts4+qT+krVWchDiChIyE+a6DG5qHj19psKmEbtKk7e0IrdXXgl1d
	9OgiGl4/JnFaqtDKlQVl1oKwnINQfP8JKh9g18J1Kl4W2bF9k+RrAEjCQIMZdsqnELgdNHg+A
X-Gm-Gg: AfdE7cn3h57EiJ6bxAAFtik4xsYW7nNMvnU9xwFawZetgkdcTOL8EYw98yJBkX4uKSa
	fI5JxWvRfX1PmQP3FeRN5jbj2n0QQ5aAtpXPXZGp2do8i5bIBYafzLrpv2+VcvIWo1rFe2Gjj7R
	Mnmlvo0NX+N8aRdmMRhroQ/po7fPkwxMtJLZIoP/QcDxwYaud44PnRQuNbEbUI8rdxtcJKJAmi4
	+oD2PVVSddb5btwA/9+YX4q8Nkir2mxNR3301w6aewXwwlQ8ESiTnImTMFMzvyBMxvyVQTtry64
	WTZkRuUoSEcbNacPDeBDzxbVFwvB2kOFhiubOIYe4b6tWv1d5bkQ/MplNIudg1KP5uTEj5p+0V7
	vP5Ew1VxVszWrkhmj6zqp6EEh0bsNcjRdxmKpimCp
X-Received: by 2002:a17:90b:3b89:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38dc7778aedmr8357979a91.38.1783944940021;
        Mon, 13 Jul 2026 05:15:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3b89:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38dc7778aedmr8357959a91.38.1783944939599;
        Mon, 13 Jul 2026 05:15:39 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:39 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Mon, 13 Jul 2026 17:45:16 +0530
Message-Id: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX8hNFXi/twaNd
 +nb/2dlFkekVgmCty70G4AN8q+lMEj4rQ8ArS4Y8eWdugcz9euYp/MUhe2uZI55/XWhrZjpOhdM
 tDQFQMOW4pdneNZaSqmiSVfR8mWFMiJhwF0EnbJmRHkpnESayncSNaImO0STDPvkjHYkHOj0str
 l49YBM3ZqOkO8pzOU5jn2lFAaMx4RJyoBpJKHSBfizm6+3f03voPbY49YGnzi5E0MbPi5+tnELW
 nIHGA/n+dsNKSqtwXdkpkvwEgR5qWecc6wgOaxMi80B9zsCSwBATx/V6KmCKbpdgWFg3fqjtsQK
 cAeB3RUbtCsIJkeBhiUJ6JkVHWykmIBMaYyGHWhWnWWhU0IzOUW1iwFKn+Svm6/5LAtOaOWqfqr
 lecTQw+NXBLSsRfO8VcwnZRsFO9j2VKDyOoePQq19GUz6x+RRKPejBuT2lH9TavSV2EQ1gKL07N
 AHAgoOXhSgH1CDAA9SQ==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54d6ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=2gB7WEHjjayKgNmZduoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Ffa625i9vBGb6XNEWObbAmwmx7qlQ6LP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX3NmI8+Gluhbd
 RgcQuYKqEFxCfFJz19VByi0GCGwd+OZuIVbb3ST8omG998rRg4jTx8Pa9avV2EH8uqOJf9BsG4H
 Ad/srlHY9J//dMMTb3uOfDb+iz1YA2I=
X-Proofpoint-ORIG-GUID: Ffa625i9vBGb6XNEWObbAmwmx7qlQ6LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39976-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,intel.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2353A74AE23

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Changes in v2:
- Use 'enum' instead of 'oneOf' + 'const' for compatible property
  (Reported-by: Rob Herring (Arm) <robh@kernel.org>,
   kernel test robot <lkp@intel.com>)
- Restore 'items' descriptions for reg property, drop redundant maxItems
  (Reported-by: Sashiko AI review)
- Link to v1: https://lore.kernel.org/all/20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 18 ++++++++-
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.34.1


