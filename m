Return-Path: <linux-gpio+bounces-39233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3CuJA3PTQ2qijgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:32:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC556E575F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:32:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EGs01pml;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YWp3WNLm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39233-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39233-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B25E43008E14
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEDB425CE5;
	Tue, 30 Jun 2026 14:28:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850EF351C35
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:28:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829711; cv=none; b=jtIG3nfKSeR4kWYeX+P8FVKb1tWugme0guSkNGo10sWw0Qsc3+xAVoj6T8flWnWH3fU/P9abSaH1GDWPNIqKiyzEPxegbbnTvGeZxmaZk4DB7JTrneq1ydzKR4XY4cf0bGL+tgWwXkzTBYSDTYsjdKh7LWN19iaMCImgIkc0cm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829711; c=relaxed/simple;
	bh=pxGcPxp8R/ZYShL4M95NZzpsckepb6RVuyJ6c8byTc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=amADh7NPYd6K9929GMQ6xaUBtSYWFDpC9VA71PbMOD0plDAhO1zbBvbtnmgYTDrXFcRfB7UiUwEQ/Hn9qIi7a3H4xvEs7ZNY24SsBYeLkB/9uXzgiai9FSmifCBuLymiSlZ2TRZN+yi3MCW50nvxO0UJNXkWDLncx8H7lC9w2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGs01pml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWp3WNLm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDsFH2153013
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MOzVAYB8ZIrn4kKf0zR3du
	jxGtWweXjQobZqHD0W740=; b=EGs01pmlzakoxR5JUg1jkYJLBYeS+4BifXM3AC
	GtabIMxttNfWfkK7cVfan120Kc5jcW0/7nhfb4GJD2uubSYrXWQq3IIpsaQBpNC+
	ihvAREfFVJw0AxtpQfAeuPNMaGNo6S72PKinGP85NustKR+tnkBW+f9uqgzIXWuM
	t+NqeDv0tLjdUfIwQzBtUsdCWD1iwCyPgpMgPK0max6rU34su79GXRLW2iGL7vji
	a1t8h8QLYq5uUMdm9iPKS7iOFwKDjMowMX9hKRGf/JnO0R0YvZVb8jEpCBmGV+n6
	nZ53SmfoawWSG4yR7d/aMoHrkNi5wCavfRFdoKw8QVE8jyKQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jxvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:28:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969208e497eso4526723241.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829709; x=1783434509; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOzVAYB8ZIrn4kKf0zR3dujxGtWweXjQobZqHD0W740=;
        b=YWp3WNLmDSzyFbRnInE+5HPtlErkNXVOSjbDi+KhVIzsNudPzuykKy5HpkzroU+W49
         Lg2eabSL6IaTVBqqz6w0uw36/1O4xFWHu/cizNnW8F6oC/Wcb8mVM0CbKOKWzfcgguO8
         gP8B06MgPhCoqSVDZBqMhHs+E9vWqrLLI9qeYqvVW+Wf3nVDhw/fBdfcvnFVB5gEsVnA
         nz81kxP1pdfyNpiCMoWSzaLGvBTd2TbRZllMLQXlvL4MTcWELLVX8UDpS1F0C7KDBYmd
         Ab6YzmQTmNveE6sIG3y9B0ZrIQStcMN/UQ9JE5T6vcU2pey5R4AKqkiCztWr7Bxa8WZT
         Lvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829709; x=1783434509;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOzVAYB8ZIrn4kKf0zR3dujxGtWweXjQobZqHD0W740=;
        b=fzUXmi3qG3kC7R5sdaLihRELqxKt403otDfNJ99rXiClQ874MIOMql6z90BXeaUrYS
         0vMkACbgISDWuJfDdA7YaoFGERyxoij19s36h4sVZhgL7EPr9/LpGrYYyUitIpw7/GfC
         PhH/aoBAC6Woghf1uq93jOrTIk/MJ3Z76RKSzBTwdgtfi4mqM/n1kEDeqK5ylWyL+CSz
         4RpEF1JqcKv9OtHEgSw7usdmhIflmAI444oJAvOyBHuZwss/W0T+KaEFwOSAbDk1vWLN
         tRtp8E3f6YarhWO+jMHzQAYuUueXPrTTR+zwaxXd7pmdDQooJEMZ7jm8T+5qEszkAKp0
         Eyxg==
X-Forwarded-Encrypted: i=1; AHgh+RopgxM8kBlYVi/lWnPXFLxBxxF4FjU44FD64lKx9HisKoQVj+OcKm1XmMiMOd865Qnfvjcl600oKNy+@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNEvnFT3i1bDotdG5JtuWpo9m65d5b1V++gH5jMQMvUPIGb+v
	LQgWZUvZOEPR3zYo4QHm1NNYi3qKA09cESQy6nM4cMcwrdSzFpf22RC+XGbkDNFTob1dvCiDJsF
	hmyPJe3ZTRhyVuJBEK+F/BX8UiEXovRFq/9JH50Ty/oCBpFpeF9u8LYaOvUKgdu+j
X-Gm-Gg: AfdE7cmhV6fyendjDyEL2pVnA/Ob95mfNwd50BYhXpMQwXJUCC5hAIKg0TGbc9/PqEb
	OfYH2I1GiHwUd9aKd52krcI/3ax5o1C7LYHaHHRy7mhr+Ebz6FxlZHFUwS35uP32CrVW8RXs5Bh
	iPj7t+AG79typcsiRWlQhfKxPsq+u92lNDBUnducIGaCXrj7mBokXwJkAGvrH/4eabl0vmafIvq
	QYnxvFJhZ2szVyKRw8Mbp5eLUG7MV0YWPbj9PlJYLnxq4cTbGi8zImm7tvdEsRe/24/U7j7PVMS
	TMbw8pEBrxcASqBovg91K48jHEgR2OcJjIm8agWtdePTU3BSlNyDBdhyh94UWIn3tQdxfzs1l5J
	f3mer8BaX4KSoP68oLRM6wyuly3+WrpxTC7w3pcvd
X-Received: by 2002:a05:6102:5615:b0:738:63ac:62da with SMTP id ada2fe7eead31-73cb8c7368fmr396004137.19.1782829708711;
        Tue, 30 Jun 2026 07:28:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5615:b0:738:63ac:62da with SMTP id ada2fe7eead31-73cb8c7368fmr395985137.19.1782829708257;
        Tue, 30 Jun 2026 07:28:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566fe448dsm7988801f8f.27.2026.06.30.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:28:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:28:16 +0200
Subject: [PATCH v3] gpio: shared: make the voting mechanism adaptable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH/SQ2oC/33NTQqDMBCG4auUrBsx8S/pqvcoXcRk1IFqbGJDR
 bx7o1DoorgZeGfxfAvx4BA8uZwW4iCgRzvEyM4nojs1tEDRxCY85WVaME7bES31nXJgqJkH1aO
 mwU44tFQqVeelkE0BkkRgdNDge8dv99gd+sm6ed8KbPt+2eyIDYwyKoDpXMqS1ZW5Wu+T50s9t
 O37JB6y6YH/iFwcinwTeSqySoPQhv8R13X9ADXfhGYdAQAA
X-Change-ID: 20260512-gpio-shared-dynamic-voting-9aab4689f5e9
To: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Viacheslav Bocharov <v@baodeep.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6505;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxGcPxp8R/ZYShL4M95NZzpsckepb6RVuyJ6c8byTc0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQ9KEHg8hmIPZpMwYBt+cL0lVMiseucA02UrQw
 NxP5hZxJgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakPShAAKCRAFnS7L/zaE
 w6CID/4lhRm4/8MDI8KAVY4T27YWZYJW0HP7S6QO/XLv6bIwoBWd2S7aR0kE3XttR5eK+dwh+cd
 WYjRb6ZaLVPF+q0kLtpxXueMtZkENB1oyjunMivT5OGARt84Y4AGlZ7a6XwVC6LU8kN/N56XB5R
 EQOxmXNyk8uhdtDzUmMjCkWwUBgTTbS9KAm5CqkwhrsSEH3OEwb/4LVAVCk/KgVsjeMdqr4pXbT
 cTYfEd+6cVypD6CfMhFIqfZ4tygtpM29KqCqdY5hCIbSJ+q7czzApt2pTzT312ZoTb4lznxDJ7x
 pO5mmbBVsAdcLeWDYdIqWDXVwB6ArqdiROWMwIlyrsmy8NfZqbABYlRbOyUHIN9ZUqzQovd6g28
 VeipSGm2ZId14EdD2huy7G8vueFSOS5q2DUFQfBv0+eKHadWbJwauAWOTZpv4MLDPJK09DxX79S
 BmAOAlNR/DK8zaBaoEH3hoxTw5jD3lG9/ejKqEd4qVpYOXc0duv7KSabl7vtZqE13wQb2uqu+Mx
 I0lQ7Pn1c+HBhf/OwJ+jSoQmLWVMQABB+jRrWjd8lU9OILZRyc/RYQbSBqCp+UaWMLPy226IZ67
 ogDAzL8RmqA1/3Uge9ZTi8Ccu+p3FhMQlLN8+SlBMRWBTx5V2gxMCgwRz00Iwb3tuA/vBAHZb3w
 lDUApAtlpnViq3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6NWgKqmx6h-zjotI5N2QXi4HkdICeVxV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNiBTYWx0ZWRfX51c4lVWZGsvG
 /E12+bBuRtdX6zEzBRA/V7dp4vbYVmqhOa0eSRn2LGzwlg0IuWwZfo9cNl2xh82IdvBWQXSPlLc
 0A4aWnMX47t+1xh3CAzA6PmVNep4+CE=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43d28d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=p-LfKV-GAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xPBwYydNSgIom9yBtGsA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=97BuGM4RKn6GwmfqMd6i:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 6NWgKqmx6h-zjotI5N2QXi4HkdICeVxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNiBTYWx0ZWRfX7Dg80KljS9aM
 aNjMUTK/HV5pr8NmBFxaiY67YFG+cGYAy0wfBSfZ2dZsO6QwC2yf6JkzwmMsfWqJOJymz+Wl8/O
 gTLncrj9Z7SdS5DQjCt6LnuqkY6l/gkhcyLUXQIgNHc17pWHmEqjke6Iq2/X1rdZq6IdrT6BrYR
 wkV6UBOSvaVajgR9AxZI5rg4VjXBd7nhkoC+c7KyWBaVk+hH/MuK0tTk6rRGyg54q6huYus8y8K
 ILJ+QFahbD33OaaTAzJFEf6qTrDvgKIGVqaEhZmebziP0yMJ30gyk8s4mNiom/hAw6Wn/574JWa
 YmpYYIJ8PO6oCM1/zHmxTwc8I5EkArFSop8RWsPdw1NtS7bB+5KTQWe5YUJHzo7Ht0ffAxLviVW
 LEoTyJZQuZORM/30h0Cf1cYo0VQT9HGS6TM4iu5WP99cJzs614TU+TdPr+yvCqR7JKlsXZRVr9V
 JG8Ok7SR94uXv5B5mxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39233-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:arnd@arndb.de,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:linusw@kernel.org,m:v@baodeep.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DC556E575F

The current voting mechanism in GPIO shared proxy assumes that "low" is
always the default value and users can only vote for driving the GPIO
"high" in which case it will remain high as long as there's at least one
user voting.

This makes it impossible to use the automatic sharing management for
certain use-cases such as the write-protect GPIOs of EEPROMs which are
requested "high" and driven "low" to enable writing. In this case, if
the WP GPIO is shared by multiple EEPROMs, and at least one of them
wants to enable writing, the pin must be set to "low".

Modify the voting heuristic to assume the value set by the first user on
request to be the "default" and subseqent calls to gpiod_set_value()
will constitute votes for a change of the value to the opposite. In the
wp-gpios case it will mean that the nvmem core requests the GPIO as
"out-high" for all EEPROMs sharing the pin, and when one of them wants
to write, the pin will be driven low, enabling it.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Reported-by: Marek Vasut <marex@nabladev.com>
Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev.com/
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Rebase on top of locking changes in gpio-shared-proxy.c
- Link to v2: https://patch.msgid.link/20260528-gpio-shared-dynamic-voting-v2-1-820837ce8cd2@oss.qualcomm.com

Changes in v2:
- Rebased on top of current linux-next which contains a fix for the
  shared GPIO proxy release path
- Link to v1: https://patch.msgid.link/20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com
---
 drivers/gpio/gpio-shared-proxy.c | 66 +++++++++++++++++++---------------------
 drivers/gpio/gpiolib-shared.h    |  3 +-
 2 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 10ca2ef77ef3410b7be46a6657ebea8cd80c4491..52a366f0ec4de71e9d6b8f88ef77ef007b660c88 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -22,7 +22,7 @@ struct gpio_shared_proxy_data {
 	struct gpio_chip gc;
 	struct gpio_shared_desc *shared_desc;
 	struct device *dev;
-	bool voted_high;
+	bool voted_change;
 };
 
 static int
@@ -34,52 +34,54 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 
 	lockdep_assert_held(&shared_desc->mutex);
 
-	if (value) {
-	       /* User wants to set value to high. */
-		if (proxy->voted_high)
-			/* Already voted for high, nothing to do. */
+	if (value != shared_desc->def_val) {
+	       /* User wants to vote for a value change. */
+		if (proxy->voted_change)
+			/* Already voted for a change, nothing to do. */
 			goto out;
 
-		/* Haven't voted for high yet. */
-		if (!shared_desc->highcnt) {
+		/* Haven't voted for a value change yet. */
+		if (!shared_desc->votecnt) {
 			/*
-			 * Current value is low, need to actually set value
-			 * to high.
+			 * Current value is default, need to actually set value
+			 * to the opposite.
 			 */
-			ret = gpiod_set_value_cansleep(desc, 1);
+			ret = gpiod_set_value_cansleep(desc, value);
 			if (ret)
 				goto out;
 		}
 
-		shared_desc->highcnt++;
-		proxy->voted_high = true;
+		shared_desc->votecnt++;
+		proxy->voted_change = true;
 
 		goto out;
 	}
 
-	/* Desired value is low. */
-	if (!proxy->voted_high)
-		/* We didn't vote for high, nothing to do. */
+	/* Desired value is the default. */
+	if (!proxy->voted_change)
+		/* We didn't vote for change previously, nothing to do. */
 		goto out;
 
-	/* We previously voted for high. */
-	if (shared_desc->highcnt == 1) {
-		/* This is the last remaining vote for high, set value  to low. */
-		ret = gpiod_set_value_cansleep(desc, 0);
+	/* We previously voted for change. */
+	if (shared_desc->votecnt == 1) {
+		/* This is the last remaining vote for change, set value to default. */
+		ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
 		if (ret)
 			goto out;
 	}
 
-	shared_desc->highcnt--;
-	proxy->voted_high = false;
+	shared_desc->votecnt--;
+	proxy->voted_change = false;
 
 out:
-	if (shared_desc->highcnt)
+	if (shared_desc->votecnt)
 		dev_dbg(proxy->dev,
-			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
-			str_high_low(value), shared_desc->highcnt);
+			"Voted for value '%s', effective value is '%s', number of votes: %u\n",
+			str_high_low(value), str_high_low(!shared_desc->def_val),
+			shared_desc->votecnt);
 	else
-		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");
+		dev_dbg(proxy->dev, "Voted for value '%s', effective value is '%s'\n",
+			str_high_low(value), str_high_low(shared_desc->def_val));
 
 	return ret;
 }
@@ -107,8 +109,8 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (proxy->voted_high) {
-		ret = gpio_shared_proxy_set_unlocked(proxy, 0);
+	if (proxy->voted_change) {
+		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
 		if (ret)
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
@@ -197,13 +199,9 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
-		if (value) {
-			proxy->voted_high = true;
-			shared_desc->highcnt = 1;
-		} else {
-			proxy->voted_high = false;
-			shared_desc->highcnt = 0;
-		}
+		shared_desc->def_val = value;
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 
 		return 0;
 	}
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index bbdc0ab7b647a44fca714bed0a7ff75101da7460..618756f6c6aafd087df267a4a32732ccc03af38e 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -41,7 +41,8 @@ struct gpio_shared_desc {
 	struct gpio_desc *desc;
 	unsigned long cfg;
 	unsigned int usecnt;
-	unsigned int highcnt;
+	unsigned int votecnt;
+	int def_val;
 	struct mutex mutex; /* serializes all proxy operations on this descriptor */
 };
 

---
base-commit: efecde8a254d1f207b75c5ebcfba2c51f4c771d9
change-id: 20260512-gpio-shared-dynamic-voting-9aab4689f5e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


