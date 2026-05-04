Return-Path: <linux-gpio+bounces-36043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIDCKjN8+GkmwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 13:00:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7C4BC0DE
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 060E3301D306
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D63A7859;
	Mon,  4 May 2026 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdaXGfuu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcgeDmVE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7B3A759C
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892360; cv=none; b=EuSdxG/qnBA0sp/P6Uf86q9DR+PFg0G2uSzBIID7coIiUS3WvPBmPvEkRQTPw9hgIgUTImQ4Ks0W8KoiZpRqxZjpyFL4z06J36oxvsxf0SFRZjZzmq/k+IAIvvPmIl5H1EtDdDk+7RQo/Ys8SP1oqxCqE+g/6MnuKN4k6iWfqRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892360; c=relaxed/simple;
	bh=7JxG9a0+MCIZqlKYdVA9Lfg5AHcwDLPHiaU90aY4OuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Il2kvevGrIBgYtQp8ehDp/vwjeuPUERLQ+FtB37j0M0xTY74bbyHj339zl7JdTgkn7cg0XIHXRnWgFmClH3fR0WWII7NytBWYt5QC8AbCeyQrT2+Ptv+aIG3Rn/2bh8ZCrX5VMGGAcGU24B8ZAs7MkB1olUVSMhEKMOGzxVnlmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdaXGfuu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcgeDmVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fRhr459437
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 10:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ym0DookTYIjJdHtgNOrhmdkhvs2SuwVIeR42yl8FikQ=; b=YdaXGfuuGJnGgu1N
	zMGDSSXG+G941arQ0MAiAbf4M5iTS0kZnaANzqBCirJCh5vTbUG1EAVTZpLgm25U
	RgueE8LROaOrRaX0fzwceizG6DGIztZ/py96V0fLQfTGT1T2wypU81qT/V5N+k+t
	sSO7bmy65o3+f21zb9SqodORdHjaNM7PWyezh7/kpGd1QkpWQIdg3hNBi33CpeEK
	k1UoAFpkV0CT+M8GA4PtuZHlRLtgRfMBUwoBhIM+FT7R2hLJ+Kv4VsJf1kDuCHQO
	NTjbT8zrbpCNLgCFacSNp8k3TXCI/I8VxdRZ9zb6pRx+bB3KUmkQAR+Bx2wQ9Eqs
	Ufv/FQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejnagt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:59:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3c7b989so71800631cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777892357; x=1778497157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym0DookTYIjJdHtgNOrhmdkhvs2SuwVIeR42yl8FikQ=;
        b=kcgeDmVE5GKCVrcVoLyZg7TQgoh0+QuJbFtLlrXBU3jhxDaxRH2wdyoVvXtMTJFXNs
         155xo3fOT0zH3Op4VW2Ztvimr3nxwtrwQ32vP5zZoZeZHNNYbAoUFILu8RxalcNcAQ/k
         m8wVgJk/f3yK3ZR9FNj7i3RtLySCzVcsW+MY9/+26upwm3fRCBcWDc7wa8P1cOe9Ug4Z
         E436Fv8qVDZi6cz791GWPfsognOqut5QvdK+9kDWwKwzOA3gTYq/BxJp9tyhdnUNED+0
         jQIduLoaczGikf6dhfTAzYuwbeRPV0HVv/g9KnTVlnUME+l+lqhbLqJ1LiLYFcy191zh
         e1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892357; x=1778497157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ym0DookTYIjJdHtgNOrhmdkhvs2SuwVIeR42yl8FikQ=;
        b=N+hagJIw0S48AuypeFIf6myzX/yy2Pu5jHxiYOFF5d1Y3JyQTinc5phVFa1yVzEAQY
         1vfn7Ak/QXCoxgbky87tGwhFpCkpCPwwhE0mapJLBe+O5Oxk108WIa36VfyOBrAdjjAV
         nGap6v78JjCbkI3pCcp8/QCE6DrhNF2al9vUnwDwHLW190I9waQV/rU6vqN7q/UWN7mr
         jOe4BOGEr0UXw3tYBgAOsF9bOdFuKHrxKDHWD0yXuBNV32vrQ14vYA5caXDFiZDgoilo
         +/lF7IKbIRHcUSBArtnT4BY6AK9aU51EjGyJpudUe5nAGsWGpVRLV/iSuXpw9On5Ezpl
         KUXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KpRdIyff+ZWELDnmKgXPavezAlvHGvJHpxS+KVUFbaJocvGvpZvZI/RhwbTGPYcp4DSI1llMHG2+d@vger.kernel.org
X-Gm-Message-State: AOJu0YyujXYhQTmkLojPgFhUx0TiqX72bBZKBG5hZ1p62U0kC4S2o/KO
	6IimVzJ2kQHzVKhEIKANeGNnMedDGoAr35t+iJqhimF2q+jDF1V0KAiPXGOb5zcQAiMrsxR2EOW
	iN4KzLF6wLsdSjJj7sIJtsbk8a696zHFIZQZBg4cRItCDnwobe2R8MC5CgsHoZO+s
X-Gm-Gg: AeBDievYHCSN8gJQIyp1P2MBn5AVAnoTBXqQd2Y9DZnzz4s37i8ux1iJDPXu8z3nwPK
	s0fRSncDLZs+EeYc2B0G2e3YNp+seVWgff1v8+Zs+G79IWEht2iW1oqY8ZSMaPPLf/fvi9ovKDz
	cr+txYs41zfNH2ShDmkAmA1xJNCcB57gryUS6qj8TpS22WHgz7PmfPOO/31SGP2lXeTje38mgoh
	kPYixXOISjd5GeZ+x9AI3ifgEj1dECyFdriWT5jJo1RojrIFkrBaO9ndTM00Sg+3qLrtvuMdnE3
	L77510V7mj5nB3KD3/51a4yL+sFRLGcY9CiFlIBh8Rp8nz0Scewab/d1UEJSNqFS8AT+TPdqR3R
	SQj0bUEB3MlVIoaQcM3zC4yonvy2+0VyMoAPhdbZCF3soifMWm1Jqk84q34/S3g==
X-Received: by 2002:a05:622a:3d3:b0:50d:9c60:fe2a with SMTP id d75a77b69052e-5104bdf32afmr133826021cf.1.1777892357336;
        Mon, 04 May 2026 03:59:17 -0700 (PDT)
X-Received: by 2002:a05:622a:3d3:b0:50d:9c60:fe2a with SMTP id d75a77b69052e-5104bdf32afmr133825771cf.1.1777892356882;
        Mon, 04 May 2026 03:59:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm474728135e9.1.2026.05.04.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:59:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 04 May 2026 12:58:57 +0200
Subject: [PATCH v5 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-baytrail-real-swnode-v5-2-c7878b69e383@oss.qualcomm.com>
References: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
In-Reply-To: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7JxG9a0+MCIZqlKYdVA9Lfg5AHcwDLPHiaU90aY4OuQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+Hv8F40bmal2NGM4+D73NxohtUby8U7XhNz9B
 oZXnOiF3dyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafh7/AAKCRAFnS7L/zaE
 w9F+EACl5E46Y4zdsjIUMNaMjTFQxPyc/2sdshlfPC1wn2kRrq5ayfJWGAaz9FM9nR/H+ORq48/
 1kukI3+S8sJg57yC9L9DLjkSnxn+u/lPTt2YBc+S1/cZwdniXgYQOCK46ofMd/VOIEAAUx7OZMt
 rSXlWFS9yjGdQ1dyTroupVZ96urBveKOfQYnIKccfbbyLNejwOhp44O8nygkkQyuxtc/Al3Ea9u
 qZ89NDfRgaVS8hl0Sb9OboCpnpakew478TEMSCFzPaY7FFuRNijCLAzTyHUopP2CQ117HWHYQUQ
 mbbe/bWSruOXBRtV640ADEsqbYWVgGAgG6vNR26+XxSdg2j3r2vlQQdvesSALxyG7NavDllHQ7R
 eFQEppGqjBFxl97k7fPGZnQ0lvmxRtp++X9i6pTW9oGB6wPYn84Uu7Wne3DyJqeW1IkGrjE7qOR
 j7Jqa86KG4mGMb3Y7fy9NT+95GJXoOkWIEnC9heDp1wQ2oZumid2ZvB0I8NC2/75vBNHzrrKacC
 H+UuH0dzb5kEG0E/U/EhoOxguI+HaDC4508+d96tCfGa9TiYRuQfEWNTtzDqpW21hlKYOoOgPVj
 gTnBPyesvsCaoPjeqmCC2+coGaQjEivkAIsBL32FMWPJIzq17FAIkEr6sRytIVi9GMi+CCnNPMD
 JxiGJHreBY8X05Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExNiBTYWx0ZWRfXy5as21gdSv3z
 X+9Msn9chnvctJR4nVaq9T2BUyqJEt9CyH8wqg/bsnv7OX/D7lar8Ln0oyssvxYeNrzdihxYhxE
 XwAhiSXKsc07YiuAsXFghAFzvRrzOrvYuUpsDABDfN1nsINb7ChARAhXeP5mlsY3xH6sXWyAVA7
 e4ltaOraRv4sdrhDjDrcs8TaacOwtZX9PeP96DX5OGgRys5BZPYQfNKZs0uGGftrRxbBzfT4FKd
 cm66ppuGrvGD/Je3bV7QA20VlDMiSAqdCAqfNECeNJss5o9repDXm5vl0c3WoRNcqrp6KGx7a1T
 XQEkYy28QQLfA/+V7SXWXKD3P2D5H1JRjqt/3jzB4t8bzI/KuIx+M1ohfhNmUGQjCFC5g/WnLls
 IBY/NSuAGQwfcYbHF89V++qQQS1Szxcp60Z7gVNk8epBx6frhFsUVXmL6taT8P4pj+otWuCyS7S
 6qT7RT7cFhg2hvDrDcg==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f87c06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=k_IdGrc-7EcYSgGcGvIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: oV1iXLQZvLHTYIrtxgFc14dnqCjxE5Ea
X-Proofpoint-GUID: oV1iXLQZvLHTYIrtxgFc14dnqCjxE5Ea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040116
X-Rspamd-Queue-Id: 5DC7C4BC0DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36043-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SURBL_MULTI_FAIL(0.00)[oss.qualcomm.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]

In order to allow GPIOLIB to match cherryview and baytrail GPIO
controllers by their firmware nodes instead of their names, we need to
attach the - currently "dangling" - existing software nodes to their
target devices dynamically.

The driver uses platform_create_bundle() and expects all required
providers to be present before it itself is probed. We know the name of
the device we're waiting for so look them up and assign the appropriate
software node as the secondary firmware node of the underlying ACPI node.

Scheduling fine-grained devres actions allows for proper teardown and
unsetting of the secondary firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 63 +++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 021009e9085bec3db9c4daa1f6235600210a6099..4126b49e7d07b64ab9cdb876326c315f9a73b16c 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
@@ -360,6 +361,61 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 	NULL
 };
 
+static void gpio_secondary_unset(void *data)
+{
+	struct device *dev = data;
+
+	set_secondary_fwnode(dev, NULL);
+}
+
+static void gpio_secondary_unregister_node_group(void *data)
+{
+	const struct software_node **nodes = data;
+
+	software_node_unregister_node_group(nodes);
+}
+
+static int gpio_secondary_fwnode_init(struct device *parent)
+{
+	const struct software_node *const *swnode;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	if (!gpiochip_node_group)
+		return 0;
+
+	ret = software_node_register_node_group(gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(parent,
+				       gpio_secondary_unregister_node_group,
+				       gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+		struct device *dev __free(put_device) =
+				acpi_bus_find_device_by_name((*swnode)->name);
+		if (!dev)
+			return dev_err_probe(parent,
+					     -ENODEV, "Failed to find the required GPIO controller: %s\n",
+					     (*swnode)->name);
+
+		fwnode = software_node_fwnode(*swnode);
+		if (WARN_ON(!fwnode))
+			return -ENOENT;
+
+		set_secondary_fwnode(dev, fwnode);
+
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, dev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
@@ -391,7 +447,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	software_node_unregister_node_group(gpio_button_swnodes);
 	software_node_unregister_node_group(swnode_group);
-	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -427,9 +482,11 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = software_node_register_node_group(gpiochip_node_group);
-	if (ret)
+	ret = gpio_secondary_fwnode_init(&pdev->dev);
+	if (ret) {
+		x86_android_tablet_remove(pdev);
 		return ret;
+	}
 
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {

-- 
2.47.3


