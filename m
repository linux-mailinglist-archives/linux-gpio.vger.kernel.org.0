Return-Path: <linux-gpio+bounces-34586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHTBG1NnzmlRngYAu9opvQ
	(envelope-from <linux-gpio+bounces-34586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 14:55:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4D389490
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 14:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2A2530151E0
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 12:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D113DC4BE;
	Thu,  2 Apr 2026 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePkQ+ZLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIr3iE/8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E083E3DA3
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134497; cv=none; b=bHdbUv7c1p5nCPzwkniClGMzJ30eMg52bLZ/5q/VaWcPmV22NDVXb0yOCeJ17SWJhHk9XJX7FF1Ln9xX+swzYvxboJr5uTm4Iy3bl1PNdyyV3sf0m2NAU8KJF6wVoetWJuBkQmnM/dzEhNTLu96ahpBthKuLj3x46EjBOWwhmGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134497; c=relaxed/simple;
	bh=UyVNL9BnEdBHdX0N3vE7Axbnavw0KwKZ6JYxOrxh0qE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEbyc+nNV7z/x1lwEecGvVbRYaAEUwX9xqZmsf/PPLbDkUeJfrmwUsZtX+fDLsqhe7Vkza8AGnW5pjeS8GyqIlQ9k5iYcMvcau06MBdLJZF6MDS1riPoiu9TS5CQ06XN8Mj9nkYO2GOyf0ST3l9EJ5utf1RI4nPlX7KNUeTovLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePkQ+ZLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIr3iE/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328RpU3351773
	for <linux-gpio@vger.kernel.org>; Thu, 2 Apr 2026 12:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkL8PdXGCakocYTcwKJcJZjn9BQ6YHeW55eR2rIFD0M=; b=ePkQ+ZLP/FEEdUqP
	H6rB00iOq4YkhjbsYVp2JtMsefxRY7b0V9eVTf3Ez0WZAV70+m0YTiwYG8nNuvIF
	iFul5qEmOsylzEiBKDDnGMQh8NleDFmgi5hoSil74IlJAkSh9iRWxyF2/ZKf3MaP
	1ideIovgSzLm5CWcYpZDZHs/PrgafdP/j+2+Hg9JzTbO2YOIPDsRb9tE4HOqEWtS
	p/rcKlKUVTCE7n4KvLl2oGdbXISZ4nasTbSwoFdzIxNFnajbUZ/aIW8G45N0EHSp
	2vYMAQ59TxBMh0iDTXI/xkCkJEkZPmwhK3+sQziaZet6rrYP2adYw/OZrzpAr281
	tFthSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh9334-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 12:54:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b781542c1so17052991cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775134488; x=1775739288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkL8PdXGCakocYTcwKJcJZjn9BQ6YHeW55eR2rIFD0M=;
        b=KIr3iE/8hjg0dPI6EVYwaQuwpJPMFkhloiwH+PAGYW0CqlcTmhO9jeeshVf1khL3ne
         ly4/ALZ2ydq9a2omi3e3Yd0J1MsvmUGu7IXDTQH1blWzk4GUeRm8LjU/ecXpynMbe+SG
         mBT8v4l5L7hDMDvUxD5VsIpBFJJojR/4SsDLL3s9pIMXnPApgdWWfETmrXK0UdqQB9ng
         MmJdAAkdVTRNHlHzP010dSJoZa6nI+0I1f/GjGJ398XDN0v1FerK+VAOqM5isypeT+SX
         P18xovdHj3FpZz+iqZgwWOIY4JZlRDYoSaTRz06NEL0Fhag5+01QUfJOdNg1LbYO0BAt
         REag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134488; x=1775739288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pkL8PdXGCakocYTcwKJcJZjn9BQ6YHeW55eR2rIFD0M=;
        b=LV5GtAFnG6nEKhVxR+Sm0qvMeIdBTSGZILKLWy5igzsQOvIxDmICzD9XdnC1PDJitS
         06UOTtFlXNAXQDtgGtPKl4PIRyyIlq8/lyp0jKh2RTA2Y7T4IS2zZORIBaBXaYd/TBM1
         AJRthMg/bc2eoz8Qs+Xe2X1hxbbRvlIdPoWMby8qPSEawCi2Iiqa1zqr6upYbg8VtlA1
         OgowBqL7YbbApDkaxSdqXSsgJC3s3Bo2ABJsZ7ApkhHmsT1maWZMyp6exURtKelhP5wp
         Q0dnIuNmSmbR1xzd6BpnQ1Q1xAeoTrGKWyywWfKC/cXOr38vzG8qYg0QlPr5UBFKB9KN
         Q2OA==
X-Forwarded-Encrypted: i=1; AJvYcCWNVHUE8yZA64EuNpkK3L2cFgZqv5QRZPtfRDirvrHBMHrP0rW94r6EvlKYML0mZkVSBN6QalXIeXk7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp12K/rahX0q5wQp+4tuvcZrXfwhJZKvKeY+pP8NvFHru6yyjh
	Egf3W+oQnfiTp1R5JH+vEIf3tlduKcm4DGduyJyDph82OOsS0FTkxCXhQwvPsYCQDNMVHqIPMGK
	shHmwk2jb2OuyGGSNm48xp5BjpslA6U1+gKzSrJvnTZuZGH5WOWLxteI23a4ve1CO
X-Gm-Gg: ATEYQzxhF95ZeU9lsN0SE+NiVnSk2oYMxoDNes6vI6gVnfhn6U7jJeFKfHBjJvjKWCn
	1CyRMTL6QTFgU5tfXXoZuz4+bDmJQkSOtKUbQa4zLMyES4m5qdA6Ob7XbqbH4uwoM2OFAhivvYl
	LA1vUY1x9kG3xca7D4ChpNDH6C+cc4AjUPZcGq3cACBzrn7hI3tiQL1BrbhE+Nzl7tlBcwUhzSP
	4o3AKpK2QReMJgIhIDI6zITppMusLGvnXk1/D3YmVhgJuPnWR+Lv/6z6gk5TSSSFHHVnM1Coc7Q
	qRKgESTvDyn7alGMW4pCREz/OacXHNgS0Zmo5jAiVDYACVqMSyqD1nKmmYMB8+nN2ARtu9VsxI3
	4vMZV2A2h8NSTHdKwUXPRIBoimJTZZWHYGHpWiYX9KmTdnWlh5XBp
X-Received: by 2002:a05:622a:a6cb:b0:50b:41ec:5e84 with SMTP id d75a77b69052e-50d3bb64de1mr92118201cf.12.1775134487708;
        Thu, 02 Apr 2026 05:54:47 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cb:b0:50b:41ec:5e84 with SMTP id d75a77b69052e-50d3bb64de1mr92117751cf.12.1775134487297;
        Thu, 02 Apr 2026 05:54:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm235790765e9.0.2026.04.02.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:54:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 14:54:26 +0200
Subject: [PATCH v2 1/4] software node: return -ENXIO when referenced swnode
 is not registered yet
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
In-Reply-To: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UyVNL9BnEdBHdX0N3vE7Axbnavw0KwKZ6JYxOrxh0qE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzmcP+BIY8RXS90a3xjPBNtfvQM3pMaCvv1JGW
 DHGPZ60AjmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac5nDwAKCRAFnS7L/zaE
 w3c+D/9KXhdti1SkyEeKtFYP4j7R8J0b/1Kk6OkPjGG7BRkDpTirvmAyIzGLElaHdSVbHQcPO74
 DCSwW+mnvKHj6K4iHOHP0rF2HbRvmpssqmUzxXUtZU66ePHgn7e+KFt8a3KtTwUJ4AirsIvv6wU
 oumWwMV4qVfAHVWQlL2mI2jh8guD45k3hLBhzk0JZBCwY7/6JeWmHJn+F+bws0i6SrSq28+dze5
 hEaf6mlV6rlYCRSWs8IqPSPEF2fRl3eKyEBq6Hj/tlQrw5G2JkYIUbPWcSV4WHi7oGmvXPLaP+7
 SzI7yLSLRk6KHMnSO2IcR3QqWoVz9goR9rQWcrnrCT2QoDVSyCG3dXG9H7WL+JRv+BKhwr4Mgss
 X12f5wJ3DgkvsRFQOyXlr5x7Tm5i/yZVsVDnAwv//syUuKfJ4F/NTuoRA2nC+AZ8oY2KVEkSCa3
 CL+s4GIP5epDDogjQrgsSbpKjyNROsAs6JD64+1zQlOmo0LZrMaRLHXFqZC1+TGIHTdoyrHaPZ0
 YbEsZhIa6Grt2aGPQSVXMGrPHzAlajh/YOvhhpBI0u3ST9CeMfhDq4vm9Zec5wCgOSr4m6cyEDW
 CeXrKv2STM1mS8Dl/A1gPR20qWh35tQfMUs04KGD35WViLkKWqtXRNu8Gk+Wad6BMBh7beGmHXs
 wCaqRuxMx0TeJGw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: LrR-p-kxpYL4eQVF78wqTsPIN2NDpJg2
X-Proofpoint-ORIG-GUID: LrR-p-kxpYL4eQVF78wqTsPIN2NDpJg2
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce6718 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WW6vG2jIvFMNhbJRSCoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDExNSBTYWx0ZWRfXwwW2+mwX4zUg
 Udz2PlhZHHHiN6I+GRnpf50ld1keE2RLMr1AFz+0D603kr0rL7yKxn6km1rMudOYTXoZrBor6tI
 y5+WC2LKvhfaM+R8zGZ4kLW0ThUvx7Zh2NHqJ/ehRShpLlKOpwXiLJKJqmIO5YeaMjUXmYwKW2L
 IYlh0fB2v+lwUk8MoCKVlQ5T8rYyMOgZyMOYn+s/gjHE7eiX9eD4N4Yt58vErSEzDTovYnkFki0
 a8XT19YiIvBm2rRruXb1HMrebM0z0TAdhpjq4Q4dDzBGrkQJXdimvAcnVnSMcb92FbmCUvtJ1R0
 tOArxMoojWhIQLUes1vUwOPCS8IaQ0/FhA9SyC1LO6azTU+msF3ABYSizVjETboA9THHI8tJ/me
 Xa/ICaTMeYaoKTe0gSiIRI6dnxi92OT8XbfIwNfTh+LnNWCrIlIG1114m5iDEAMApSiAynIz9Rr
 xRB5BYUJjfNMnhp04Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020115
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34586-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 07D4D389490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's possible that at the time of resolving a reference to a remote
software node, the node we know exists is not yet registered as a full
firmware node. We currently return -ENOENT in this case but the same
error code is also returned in some other cases, like the reference
property with given name not existing in the property list of the local
software node.

It makes sense to let users know that we're dealing with an unregistered
software node so that they can defer probe - the situation is somewhat
similar to there existing a firmware node to which no device is bound
yet - which is valid grounds for probe deferral. To that end: use -ENXIO
which stands for "No such device or address".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..29eec7ba500e8c8a02482dfac68f2c313cfadee7 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -EINVAL;
 
 	if (!refnode)
-		return -ENOENT;
+		return -ENXIO;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);

-- 
2.47.3


