Return-Path: <linux-gpio+bounces-39828-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6zuJHwX8UGon9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39828-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:04:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62C73B943
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:04:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GpI3GCWo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Th4gwyoI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39828-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39828-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94F52301B005
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914F423D7C2;
	Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75862472AE
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691514; cv=none; b=NNnxhaJr/kUR9ywUzYbuGxooRCl11JZl+f+mgV8Hm3gqvwIotlUlLTnW70uhxkDTq/RG0v411JYLez3hcB702LQVpbyUIs6EDtboYoFLl4IkqFX8z4Y8xjsOjvd2Q2poi1fp5hYB7bcyuaAUUowV8X6aT7DhTvXDa7Y8RyHKV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691514; c=relaxed/simple;
	bh=neo7zHO1q22f/Aj8nISxBtgyyCitpGrHRzWxXr7ijA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PKQNQ7gOutzo7uYZY4oEhInD4hOros6qC+MFHUeh7p2mj77Ipr0fsF7zJpk0R+I9bafCD8qZmrMeNkgagNB3fZkux9Fi2/cy1tBfuLB5TLgyAisTZg+Hq+V3wKS2DN2+fqjqKjYjD8TTe6LJ/a+sk8IbF/DrHsZ32MELcrgBEsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpI3GCWo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th4gwyoI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD62bG776225
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IsDPLn2lxw6fgPhVuow78b
	DKudDYUVZdfPodAAJcnlg=; b=GpI3GCWo4qYF8lG4IA7aUoXMwsJK8fc6WcX8vc
	3e0iA9Z2CKwLGwwxJAbklvLehOq8z8YiEQSsa2Hi4pQiMYnewqTsgHltwxBm40R6
	qQQESFLSQWfwwij9jFEaDNmDv3/Crr4EnKNwO3HsewgrjUQJk3S15rJLlEWK91fa
	419/C8M9lNGO7GX1jPhy55fePpcW8j3R2qh8oazr27yLgNSQVFB03PveuvoBqKVs
	9KyosVczGwwo4pEUcMhy436XfVSznR9VU4ODjQY1N5iYD6klWh9JTwQnOOcQjLtn
	qPo3fSZfUBXyj1jb2vQSPepfL2gO2ZRWJe94mLacbSV5TzqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgx7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso203184385a.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691507; x=1784296307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IsDPLn2lxw6fgPhVuow78bDKudDYUVZdfPodAAJcnlg=;
        b=Th4gwyoI41bdrZLS0NMyjPlyohdodfEagMwJQAjU5UgNdIIe98aJcb1ji/u12YM5g5
         TQNwF9aUQwi+KQzpSDy5DYdBXEh4Te33z35dIp51k6TRw2E9Wl9So1+buRKevbR5Fm//
         dn+a0yhRoRlDuPAVaOc0mmXQ5T2MAgF2uOXStX7WrAx/xqgNJYiklIuGVxsyEYv9+l0T
         sSQg5uYwwFjzJY1s8erolqxFhPaZ2j2ILo+Uig5oXeQgWXZbKH/pesDKnZswcGwiFwHr
         378WtC46WRyiKA0zooZDRSE/HTCc9k1nlN7PcxvR24H8rXeu7ZyFmrVlmaIyIRACEImj
         Kg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691507; x=1784296307;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsDPLn2lxw6fgPhVuow78bDKudDYUVZdfPodAAJcnlg=;
        b=mnXAx4QcPJ5qa/TDgdIIgYURKFe/LRRlvqxii47J5Ou7CT3HG/nX3ohtP0epuBkW4x
         15qkqUJIFvBvGkMTORGl3XkvFw9W6aKX9qrvIZ9p0ZZztN2dk9iR+lOU9pz+mV0jjLyC
         /IY0AqhtGa3I/nC8HFPXOzBM1oHRh3GyGXP6yfivxEGVAGyoVpy5LPAkAibuQ/BtxMI0
         g42CYHQoKGtDQ16JlwhsSIkYEuX0NuOgi92FcYGA14rW2w0ZbT7vVic8Pci/x11fqXsE
         oLpWe5qeVg/J3DTtIylhf3Dosd1wF805xsxcuiuWXwsx55UwXNT3R4hzpIVgk7VAPUjI
         2CtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoWUh+ygSUdjXXejVz26uARbdTl0y8oXXFLap7n+eTLkQPQrogNBZOuh39vYw5soI2heq2NX/aHxZu@vger.kernel.org
X-Gm-Message-State: AOJu0YwGh52mJH/79Th/SjB5kmUapQVcdaTfjCplZeidolsOUvZgiYjO
	pPSJslqP7IFQj8tK0Rl8cpCJuWkoY0MKoYxB6jzj0AlxmwhOmit9s3vxCQVfzyl/TT/dz2H2MsV
	ySW/9cV/2qKaxL3YrhQyc/m3b9P7O6DOgs+9ch61QOsvUgZjiO1R+3wGPgJBd8TuDDVU1Qcis
X-Gm-Gg: AfdE7cnksfLq2UL9gqCGXEXdUsxolOHeSwrCKMdSMSdeJ3Gs2R65uYXATrqSUPuyrrE
	Qd99XUL0xCXCmLhQVFsgjcjJOsnOHO15j1U3JFEr8IQNt3AHj7PuuE4KkrvghNiNtJG7cQq6R56
	I6LozMKt+KoK+dtrAQzzIAOLkZ5byqjd6ThlwB5Wxip0/b+B0HRl7E+akRomNeJ3oNezR26qaU5
	vYS0iqfjEb620CGlPNb4tJeDgmCh1inOxpSZ/wmAE68fFhcC4NRP+Q2Vm1YicgtSslOBg9mUHIh
	a99WL1W8wm4YxMwhvO2a4dc/EZva4hbHVz0V9SjCy8Dw8G2M/8l5m1ZBt9HUmpg/O18dQzkkjy4
	jWmuFNZ6NEed81jlWRWVo6dYBBFLd+3SNYGvvxz3S
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr37155131cf.44.1783691507346;
        Fri, 10 Jul 2026 06:51:47 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr37154861cf.44.1783691506844;
        Fri, 10 Jul 2026 06:51:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/5] software node: provide support for fw_devlink
Date: Fri, 10 Jul 2026 15:51:19 +0200
Message-Id: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANf4UGoC/23NSw7CIBCA4asY1tIM9GFx5T2MiwJTS2xBQamm6
 d2ljYmbbib5J5lvJhLQGwzkuJuIx2iCcTZFvt8R1TX2itTo1IQDr6ACQcNonUbajlRj7I29UaV
 VrVWBpZIFSXd3j615r+b5kroz4en8Z30R2bL9aXxLi4wClQKgrGXB6lycXAjZ49X0yg1DlgZZ0
 Mj/0AGqLYgnqM2FBKFLYIxvQPM8fwHSVGPgAgEAAA==
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3949;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=neo7zHO1q22f/Aj8nISxBtgyyCitpGrHRzWxXr7ijA4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjmjh6ryAQpnavue1CEEpD3WG6mmgQPBO2J8
 +YOqIF0EVGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD45gAKCRAFnS7L/zaE
 wwzbD/9ClSYchp9fPns+RvmXAQpK1xzqoPyU1vKbu5gynMkYlsxSABd8WOVXhZWC00z6yPdxcFv
 ZjJhOsW4Fvf0g82/FiDYSFKXJaaV5Uwr6aet6lBVy5ThMLU46BlkaEPGCkVaf9IJx5wC3hRHxca
 S1kwWM7IbTS1BIa+A8fjNRlz8TP9PlwuEKrOSrVt3U4mQyAuZj+0XL/6Y0FXjNpySKLZhyfylZK
 MRaZUUR6RFYHgmzIYoLBCtlUo8O6JfEnqZ/zMXAq4iVLTT4eIngstRIuUzvgTjF4VvMTwxUPC7O
 fnLI6Q4JL2hRbqBm8j1E7JbFYm+X1exIeLy5+FuwI31XY9qXX5gJG3JKZ6A232NQGMsqjBMjwCK
 5GzIuOvCefA1//PjZnrzhr0OkQvVi0mAOkEaH2rEp33gPuWtYw/axIRre90E0ZXcCoihTZIOIN5
 fwdDLKc6kQ7Wja2NowtvMQ5N/vYTg1Os6RA5R/U48ILDuXfLafSLW+JFyO9ZlLMIbbAvRcxbopu
 O3aUM6nE6GBFhQF5ryAZNNQ5cHYhS0I/NSiUCHovR+Os8YqFgYZuYYBQJ8iKrzImRhZSFEZ8IEu
 VZPdVO+kzLslXOnDCawwYzo4ZlTHVeawqUiHQuEqjbI1hLJ2eN7rQLucVV4nh7EbS0m3YWsuoKk
 B8NJmOGQOAPdjcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX36lGEmoDls6D
 J8Kcu7aVuHnW35ivlyYTP2i6FgDSYgfPnVNUkFkGKPVQMYkyTy6CA+JC37g2emJFyJJ095wMc7H
 loF+nZ5cIyrald00/f3Fy0pGBtzKrnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXyXxmsFlyoK86
 eB8LyRvBNSzoer7zPwXVveTjjKlYSJMla7lH78hw+3HNSzP4UV9Cb+iLECVvGB90ClnZchdh1vV
 wYSrOfhQbd/z4rPrbnQLru6WhUwa/LuLZokVB8DTybw29BXCcNgaIcG/tdpMVPj2wSkIFtebndS
 L1OfASvrKHPxzV9t3wMoyHB2eUcBc+PAF2gmHfQuM+wFnQgd4AGGUyt3r5gfAsl23fKZG6U7XK8
 kneM4nilAtAdJqPiCgiqxjOPUxszdKG+8z4SfgoV8wACN6xiYTwXWKNysJxOd/jxgSOAsTFRhAa
 Nnsc8x3+Xs4gj6KOJuKeQEAmWUKn9Aju1i5ULvWt9gQgQFK+tIbczR5si16SGxUQgzn4XtmRVKm
 bgkBBWOFPqfHJK7gAUdsve1UpBzK4QaKU/YX/NcX5OGUXAUUjdnBSmZBgGTRDrO20MygG3qn53o
 HgikFNL4s/lZedwIHHg==
X-Proofpoint-GUID: 0wKo4mkECsGKVnbWXRKjhy5kLoTWeIdl
X-Proofpoint-ORIG-GUID: 0wKo4mkECsGKVnbWXRKjhy5kLoTWeIdl
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50f8f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Je3Peepqufej3slHyXgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39828-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B62C73B943

Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

Patch 1 adds new kunit helpers that will be used later on for test
cases.

Patch 2 implements software_node_add_links() modelled on
of_fwnode_add_links(): for every reference property it resolves the
supplier and links to it. There's no allowlist like in DT - a software
node only carries a reference when its author explicitly wants one, so
every reference is an intentional supplier dependency. Graph
"remote-endpoint" references, unregistered supplier software nodes and
self-references are skipped. It also mirrors the device pointer onto a
secondary software node so fw_devlink can find the supplier device, and
purges the fwnode links on release.

Patches 3 and 5 add the tests: a kunit suite for the add_links() op
itself and GPIO tests for a real-life use-case: a GPIO consumer
referencing its provider via a software node.

Patch 4 proposes to add myself as a reviewer of software nodes.

Caveats: a supplier software node must be registered before the consumer
device is added, If the swnode is registered after the consumer was added,
add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
supplier is missed. Graph/remote- endpoint ordering is left out for now as
well as there are no known users.

Merging strategy: with an Ack from Kunit maintainers, the entire series
can go through the driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Use device_match_fwnode() where applicable
- Fix a race between the actions on the device_link_mq and the GPIO
  test cases' swnode management
- Link to v2: https://patch.msgid.link/20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com

Changes in v2:
- Use loop-local variables where applicable
- Reformat a long comment
- Keep trailing commas on array initializations which may potentially be
  extended in the future
- Add missing headers
- Update MAINTAINERS in commit adding a new file
- Initialize arrays at declaration
- Fix signedness of ints where needed
- Remove unneeded DISABLE_STRUCTLEAK_PLUGIN switch for swnode tests
- Link to v1: https://patch.msgid.link/20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      gpio: kunit: add test cases verifying swnode devlink support

 MAINTAINERS                             |   2 +
 drivers/base/swnode.c                   |  79 ++++++++
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   2 +
 drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 286 ++++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 849 insertions(+), 7 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


