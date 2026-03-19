Return-Path: <linux-gpio+bounces-33833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB8AJVEjvGkptQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:24:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BA2CEC0D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 808B43202CA3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962A03EAC9B;
	Thu, 19 Mar 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuqVAtaD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwlucFd7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF73E92B8
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936674; cv=none; b=u2RWLp+bY83BjeR26j6rF9qOucjLOXfiUsxjk0BT364q4Fevik3XcJ8Jv0Y+yNT2v6k6kUT5uEgoYI8j85ZaVmSmfeLnsyNr43y6mmybC+oAaFnicCQrAOXc/Av0uOayqlUiUzfO5DgLBCRgPTI7IABCszZ6SAs5o5znsinkWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936674; c=relaxed/simple;
	bh=pAa4lSJt1eX5y7wxtdI7aP4F3W8n+Uq5GJrm501jlWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gG3wLOvHrNBHjcx5Xs9kmvfp7btxz46ccchi5zDP8fffiylH+gzfR6yyRGD3DwGyHXfsXXBn/gxaFz4iHOe0czBObFGEqiGPmJhmt3Ee2oRbhYo3GvSV1/I43DBNPcfy96FjJrxvo8jRrmZ2zMaBTce5UA8wmwNB0+t7KwolNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuqVAtaD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwlucFd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFAF912544614
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nceZfJ+3sqBsNfl8MmkTbM
	4rULkZHkwhD/qFdlmV7fw=; b=UuqVAtaD4p6dbgtmfedqzWrSZ1NyaJ34xqcOVd
	u/0GqvGhhjR2OleQO465Uv8odGoND2oaERQX7AnY+URkDfUMTOeyfXLSOTs5xpKG
	KJ6KroKhzTz7rIWIjsv9cQrVk7blULQtOJtzrB1CO/jehWwVDgTF0dd+65SWyH1f
	KpzJI6ZqR1RgJPBJwKbVukg6fNSL27t8ERrexW6KGjPb6q1bqiMs+FRrVzmJ0tt4
	UhnoECwCXCDvJGKzh9my+v/EnxmXsa8Rt5Zwa8sW2Kom18xsjj+0L11z0To3tZPD
	Js5Sqw4kr3v5HBSf7YZpsshh2i6kM/7LpAhSI8I9549bg/Uw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0957t95d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94eb847f11cso10341385241.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773936669; x=1774541469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nceZfJ+3sqBsNfl8MmkTbM4rULkZHkwhD/qFdlmV7fw=;
        b=cwlucFd7CNRy1yyOKrHMzqVQUNXBNg7YoXcdPxB30M1+WrwmfkgMzpjfPDFKuuALHt
         rr+LH+ke1anEFGwoO9spW3/qA08eM7SczUGg2KaX1212nneW0ijCbbenleKFP1PtDE/4
         abfN68n36MDeZfNr8xYBfdt9mRqpahkQc7TKCrHFX5nsa+ECp4LfBqoyTNR6GidTKsc3
         /eSc0XxDFp3v16GsVRW1K0wRFj9Lq4E7Z7/FXSxwsQRJSgsdRnpe8Q/5e2SHURhbbVug
         CA+yH+LerqO9gkNOTGhd2vc+cSgvSEC1dmEnFqNQ7Lqmuk4y7PbyoJEUB5+lGgSprsHb
         KVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936669; x=1774541469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nceZfJ+3sqBsNfl8MmkTbM4rULkZHkwhD/qFdlmV7fw=;
        b=HHXY7drg/Y8jVWDMq1qzB64FZKuO9y+QSWjQSltTTA8BpUtKosMsGEGFWj84yt0LJm
         pBtdcDfPTuqZdwCjZmhI+/XAwORMp/ONNRzyt5QdhbCi+JruU5nz7l8lghXWODvpiWYw
         dbA/uqCKC2j5ffUI9JF1hRX6vmUQ8AcTJlcnhV8XpWAYscwWrAX6ubwZxvVW+wOz13kg
         LCEjusev+9uiATmrHqf14CJhQyI5fSiJG7Mu4j6RIxM2C0Jvw6XFHWrV1yLDJiGP7Fks
         F2iVZp1Pvod/AoK4nmTqhoNjOyf6LWx58VuRP7afXta+1+89CB7mG4cXQdP/nX4ce0tT
         giIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoG9ckzecDGiBXXPQmoU4HyKJmLwd2u1zGs26DDyvdXiUXggfL2FiDGcHE/lSnTjZkTbWv9L3nidkH@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOoe/uHi84XnKWb0P2MHtjj670lebtjPzk10a8voe3BaL3CfL
	pnNehVUFGUesilQYETBflD1Wd7Ep0CeoKgzsYMAQpp7BdENl3Wa03jwn/x/i8KmHK6yCkVpoMXr
	ss42zOb3iOu1Iwl0AO/OHmuNUSkPS/ouFCPKE65z3LhHo5i+RyyGNbPnHSrpEPTUW
X-Gm-Gg: ATEYQzxr6WZ+Ih615mqXDv4HnH+gWuqYCV8SWBhsSD9eFYt97ot1B1GqV3rTLNJoW8O
	hb0rDcZmfyuV5LGfEEfbhn4BglUAQZaZMeViN/Zx7/Rou44ZqwSlZlK37lRjz+UQcFpegZUKo0Q
	wvcyGsy6TG8Uo00iU9RgDeLcgBzFcCJTwdgQCSrDAxULIUHjsL3NmgQ27ELcMelILg8qG1vwhLf
	uW2xCFZ8T4WF2aQf8qpc0u4vW9wfwIVVWANM2dgxDPIhWQPyI6IVAwUzIo1LWz+zUSmcN18D1bO
	7Dwsm0aAEcZWd9+kzdJd/4WO0F/mDTvcs8/sTQ6ezHdWw216pLPRh+k9GUDQLj/gM50wN9aSuxw
	FigAsEKxPNJXMRhK0JDlrOGPuDEiwIacPFtdjb7PPKrh11F+YCPlJ
X-Received: by 2002:a05:6102:26c9:b0:602:80fa:ee9a with SMTP id ada2fe7eead31-602ae79fd0dmr90736137.0.1773936668958;
        Thu, 19 Mar 2026 09:11:08 -0700 (PDT)
X-Received: by 2002:a05:6102:26c9:b0:602:80fa:ee9a with SMTP id ada2fe7eead31-602ae79fd0dmr90694137.0.1773936668505;
        Thu, 19 Mar 2026 09:11:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9d74:8015:408c:d719])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e5495csm83756915e9.2.2026.03.19.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:11:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/4] platform/x86: x86-android-tablets: use real firmware
 node references with intel drivers
Date: Thu, 19 Mar 2026 17:10:53 +0100
Message-Id: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4gvGkC/x3M3QpAQBBA4VfRXJtalMWryMWwgyktzcpP8u42l
 9/FOQ8EVuEATfKA8iFBVh+RpQkMM/mJUVw05CYvTZHV2NO9K8mCyrRgOP3qGK1jS0VlzWgriOm
 mPMr1b9vufT88Ue1vZgAAAA==
X-Change-ID: 20260319-baytrail-real-swnode-7de7a3870f78
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4472;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pAa4lSJt1eX5y7wxtdI7aP4F3W8n+Uq5GJrm501jlWs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpvCARRxDRtIINByeRuSym3dN5SmO8nU7TwUKxF
 VxxDZ4+/huJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabwgEQAKCRAFnS7L/zaE
 w9NtEACIoDgpGhpNS7/dur+iU8YGQwrvgaM0TBz/nl1UhJqMNXJUq7bhFSR3hYEMFRubZa/LEU/
 nPU7YpaZJhNtJrFRdLUW1BSUzesL/beg/0nPoZ+LMRg4gxFywujHceqDR7Z1+/25hDMXJP39N7H
 neNeaLyLKxFtcwvZ8OLSdydCdvi0rQ106KVFNmXlrPttmK4t4iCLsAIuEYBuiBSz2SLgngwsdNg
 7QLCIa3Uq9T2cGxUGpJCmJN64Hkn1iWPeRfBMyct31TAA+ZlNP9cnK759f0bPRycVPLhGpvBGp1
 sKD/pp1W7G1kxStrOeUPs5i6a41DR6cvR9+e9P0u+rFQhUGv+ed1C5ot2lJrdU633ysn/seW0pK
 c4Evq4MRJqo5cUbxT4arrIlcSV0x4NlNhICbHpw8QH9mGjCT8KVHA6+/rIkf3+Pbozj9Azxo8IZ
 i+n593rFtErjRG18Qwyaf9ES6VCcdIjUfsX0x2KlEyBURa1baj29lAf8eneLQz4M1VOq75mYs4j
 dLyrL9xq60s+2fFLSL8FZX4arBe+m5Qd/1rmVygO2tUKnSFGTO8VxeSDhsl/1Chx05Ijx2if2Lo
 aQp9T/5AGZV/y91PaS0iErzQRGd4uck7XXojgtGlUi5n9coRn3dqzRHpTj52V/RgTg985+yyYZY
 FRMXL25e/bCbfCQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: jjbvYOmpajLdWkeQM658S2aiuD_5NcS0
X-Proofpoint-GUID: jjbvYOmpajLdWkeQM658S2aiuD_5NcS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyOSBTYWx0ZWRfXxUHSIkUPjFzH
 nLqy84Vq2oLUNcUBTxRCsew9JrHnOba5DipL752M8OBirIu8STRtOiH9M9Fu6Hcb+TL0oFuEXDd
 o8ctjSiIKq0WTKOlt1KJE3igvMOV1ZXuqDJsRucxq7Dx+Izk8fHFhfZ2/7dIkZldpia28Lg1Q59
 N+IJI8+dV+TQ+roZVTAG1pqQIpPnIKhZTkYskkEE3g3lHWWgfIH9+Jnm8NTbHvo8TE+lyCipM03
 ur45jsRup3H6Q2AVQxEQ31hCZ/0PK4eDdsiI7fkoLkf8F0CiNRpq07get3FiJB+jLd45MRB7eY0
 dJChKgWCzS717VCv55uO3m8EQ/CqwzXsHq0TyPVSNfDQkFY+7lEf10WZul2ZOydN+gy68oxrZqD
 N9QyRZnO3eO/0w/tYVBa9PO+p15KFYKJ73AU+trVUSlU1eTi8+RRm8lzILig/6mLcsvm7TciNm3
 GX+54iNHbN52C/G+kxw==
X-Authority-Analysis: v=2.4 cv=RZedyltv c=1 sm=1 tr=0 ts=69bc201e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mdeBE-fw4-FjdeD6YvcA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33833-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F5BA2CEC0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Problem statement: GPIO software node lookup should rely exclusively on
matching the addresses of the referenced firmware nodes. I tried to
enforce it with commit e5d527be7e69 ("gpio: swnode: don't use the
swnode's name as the key for GPIO lookup") but it broke existing
users who abuse the software node mechanism by creating "dummy" software
nodes named after the device they want to get GPIOs from but never
attaching them to the actual GPIO devices. They rely on the current
behavior of GPIOLIB where it will match the label of the GPIO controller
against the name of the software node and does not require a true link.

x86-android-tablets driver is one of the abusers in that it creates
dummy software nodes for baytrail and cherryview GPIO controllers but
they don't really reference these devices. Before we can reapply
e5d527be7e69 and support matching by fwnode address exclusively, we need
to convert all the users to using actual fwnode references.

It's possible for drivers to reference real firmware nodes from software
nodes via PROPERTY_ENTRY_REF() in general or PROPERTY_ENTRY_GPIO()
specifically but for platform devices binding to real firmware nodes (DT
or ACPI) it's cumbersome as they would need to dynamically look for the
right nodes and create references dynamically with no way of using
static const software nodes.

This series proposes a solution in the form of automatic secondary
software node assignment (I'm open to better naming ideas). We extend
the swnode API with functions allowing to set up a behind-the-scenes bus
notifier for a group of named software nodes. It will wait for bus
events and when a device is added, it will check its name against the
software node's name and - on match - assign the software node as the
secondary firmware node of the device's *real* firmware node.

For now it only supports name matching but I suppose we could extend it
with additional mechanisms if needed. I didn't plan to introduce a
generic API for this initially but the code in cherryview and baytrail
drivers ended up being exactly the same so I decided to factor it out
into common library code.

First patch provides the new interfaces. Next two patches set up
automatic secondary fwnodes for intel baytrail and cherryview drivers.
Finally patch 4/4 replaces the dummy software nodes with ones that will
end up actually being attached to the relevant devices.

GPIOLIB is now able to match a GPIO controller by both its primary as
well as secondary firmware node. While I don't have the relevant
hardware, I tested the series and the new behavior on x86 qemu with
a dummy ACPI table and modified gpio-sim. I assume it will work in real
life but testing is welcome.

Merging strategy: This touches three trees and there are build-time
dependencies. I think it should go through the x86 platform tree with
Ilpo providing an immutable branch for the driver core and pinctrl
trees.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      software node: support automatic secondary fwnode assignment
      pinctrl: intel: expose software nodes for baytrail GPIO devices
      pinctrl: intel: expose software nodes for cherryiew GPIO devices
      platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips

 drivers/base/swnode.c                              | 105 +++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  40 +++++++-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  47 ++++++++-
 drivers/platform/x86/x86-android-tablets/Kconfig   |   1 +
 drivers/platform/x86/x86-android-tablets/acer.c    |  11 ++-
 drivers/platform/x86/x86-android-tablets/asus.c    |   9 +-
 drivers/platform/x86/x86-android-tablets/core.c    |  47 +--------
 drivers/platform/x86/x86-android-tablets/lenovo.c  |  31 +++---
 drivers/platform/x86/x86-android-tablets/other.c   |  23 ++---
 .../x86/x86-android-tablets/shared-psy-info.c      |   7 +-
 .../x86/x86-android-tablets/x86-android-tablets.h  |   4 -
 include/linux/pinctrl/intel.h                      |  17 ++++
 include/linux/property.h                           |  18 ++++
 13 files changed, 270 insertions(+), 90 deletions(-)
---
base-commit: f50e991d263338028b296f4398c669feca8f0c3b
change-id: 20260319-baytrail-real-swnode-7de7a3870f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


