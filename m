Return-Path: <linux-gpio+bounces-39832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U/DBBJ37UGoK9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:03:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87473B900
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:03:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BRkIObGH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dn5lUw59;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39832-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39832-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D514131117CD
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D39284690;
	Fri, 10 Jul 2026 13:52:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED525B086
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:52:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691526; cv=none; b=CgtZ4gDrbR1FigPYnZQ8Nw3CNXBVK7sQbBoiJS7G5IJJ1aopuLmqY0p4mUO5hhuoOeM0m1gJLTq+0DgFKOvU/wAldHl2iBFCdDYcWq/06OVsNfPUpVpBefdkeYTdat4cyyVyAIeFfInamijq3UOTouRcaoatdI/PYKuWSp7c71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691526; c=relaxed/simple;
	bh=CFrdgZbVB79JRVdgy1NMnyDL7oZ1pLItVngC17HzSWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iCf3UlUBb8FXexpjDeu3qgShRC7UiEHwEn9Dg87rAodheZ7QDtZmX63U/PlwUWkFBUxoLAwc9WwgT48hVc++zVbmpx/SzIORYnmUwJwdSMjC0/WfPrKx7u3YYvtMj41QXql+FyUVCblOelWY2f+n9Dd4zVjC94ybRSxy9kKF240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRkIObGH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dn5lUw59; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6OKq871560
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KjEgunGRHSr6O/b0XycHyRTbVCGHQqSoducIqInOUVA=; b=BRkIObGHJpZ/RvTr
	tXdoYM1EKR19XU+559sJYPB2JiCfJB740ay4heYLA+HnIkcM/gPVCus0vMOYgVyP
	mxSIgwnXwpYQs3nwwUO6ilMHxABSrHsaKkSUF0KDerMPIuQhd9R3t5SfX7q5Zd8i
	grZuLy7rA5yhsJsV4BOencQq/h96kVkCWKdThCWro2Vn2TUaSrXrVYRoHyR54FW3
	agrfZUmJAgqSp1hB8yvQD9A0Qw8RIqkjQtLRvghi5rWuoGKlcPufiPOpV112e0eK
	SbU1fxW/j1k19CMM3VjhxOlgtuNhu0bM8LWJPze4T7Sz8giosVuFIaq8TGnuzTMP
	ikMvYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8pwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:52:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso10710461cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691521; x=1784296321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjEgunGRHSr6O/b0XycHyRTbVCGHQqSoducIqInOUVA=;
        b=Dn5lUw599XmR8TN7pGUwcYL7sG0uhpqsU35kXDwsctvuGDkRvGjndenscgy8WZAn60
         M2vEnbYTf5uoRH3VLfI/z11pvz/Vs+KVhZATB6svTgLaOxAC+Zv2S9nDpp9xwGNgJwsP
         jXu78fR58Erq3Ds6uoUqlLDAaZBBuz2gSov0u9AhwA7PNtEQde8pjjsxcXiSSen/E9//
         ytSdhYsoVbFf3yiSIt8uAf9MfK5p8JggqgR0q6/n5q0mMAeeFHKC6Y1/jet886dFCWe5
         ldveNoV9E4l8772RYgK75A1+F4iwoQBEXfRmEV1E3K1x4L92O/XNXLtwpbN8EuvYur1f
         xEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691521; x=1784296321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjEgunGRHSr6O/b0XycHyRTbVCGHQqSoducIqInOUVA=;
        b=cH4nqNKSKJX2EvBWjCvUJ5ugm3iGW4sh55UrGColjZadLOHYcUMLh9BZycnOEvBAai
         UMf4M+LYj3eeOW7g6viIA9rxZm34vyIclVc9/dgYBSJW0gyLFvpvN/Fi4KibQ1FIowtJ
         iNmVnzSYAUOs8YHQjcor1B6w0ldCNlPX4w1Ablxp0rihKW9iY5MVTbofTlTmijJfrGkC
         5gZwvqbqrlDxT5mWJWd/vOUNhaWpZSkWMCaFBTu5mMNT+xwgEjlV/svet1WfszMTftZj
         yXoDL8Ba3kp+HGYl//eo5dGeaZKZvdzq/yTbOOY91PwiPKeMxzmunLk5V+InTbwG4K3o
         lVMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW0G1gM5fqNDsH/GbGpjtPCL02XJHw3YdsS2KExFZCU6pOxEoG8SiVNaqi7igo0FZ7RMP3Fsj7mJ2G@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqTBwNQRhM8RII1V6KUMluZROSdOqC4aJbYv7Gj/mpjr64LO0
	WB8KYwOQU+lvNDSN68yolUGviREjVYpoTBi02h6nZKAM1jrseux6gAFgxFo/anoQpcKfbuqaict
	KDIPIbzgausj0eU5kH3ItIxXF+K58zC3CrErC2iIViqspB2lsmidhotMZIBw+FlWC
X-Gm-Gg: AfdE7cm33iP+mEZsODPhFqf5kGxqYEOx8PZ8cm/IlhLdg7iRsD2NRG0PJGj/iiSWpU1
	hxA4nXcZ8c7Qj2kkrwzShIGUSXoWINo065n5ix3c3rKsovK5/MotJIrCNiogJF5gWVoyRZYc0DY
	J8YjH5uoY7Nay5QtwNYwdp3lbb+061sN1R4M10NJBWw8i8jRIkvp1GtcLkQO05jJnjyDWnmeXJk
	PR+Aa7SKx+3/gOE7AjlM1h+PGF+C28CFQFCKtKmzedPXQ3aXo3sBF8Zl3v+zTfU9/lMA+0iY4ke
	gsCEZY0oKjNcNrLvIb8MeVPNfsrygjUZHgZDdz2/0Iy3cIPhMUaNpjlz9byZDjpGbP9zuZvHgcU
	MSbwTAfySVtts5E8mAOwjeOIyyfgLQIoTPExz9Y8m
X-Received: by 2002:a05:622a:94d:20b0:51c:8dee:964e with SMTP id d75a77b69052e-51c8dee99c0mr79277631cf.57.1783691520985;
        Fri, 10 Jul 2026 06:52:00 -0700 (PDT)
X-Received: by 2002:a05:622a:94d:20b0:51c:8dee:964e with SMTP id d75a77b69052e-51c8dee99c0mr79277411cf.57.1783691520473;
        Fri, 10 Jul 2026 06:52:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:24 +0200
Subject: [PATCH v3 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-5-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11893;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CFrdgZbVB79JRVdgy1NMnyDL7oZ1pLItVngC17HzSWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjvL2HjJuGt7YLd4fcBkX1g9NoN6biwfYpp9
 gtdKaCEhMaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD47wAKCRAFnS7L/zaE
 w/TVEACkrSG5GWFakHjwZcx76ywa5Daf3KasZhOxBAU5ZkO3p791QFyumsb04oSzWDJaPZUhtkj
 azES/YungvYC+wldy6E+6Szv2zFDSpp1cNeatSo8XWPHeueP6Jqg4/FvRAJYd52TJcxV7VRuLWP
 XBsVLNJIJdmuPTLimmZ4IA81DGDXlSvk3F1rJxuPMfGxjSgrn86VyVNzIu04KCTdW3rDatSGvio
 1OCg9FoK5J/H2ao00hJKCENlYMs5IgpN5BpQJ58/ZKQrR1rEgQHN3T/3FCiwyhLlqEqmUkfze96
 jqY/bD7GY4ipoIsxTzIXXnUkjTgbiqHe4uVoeGuLUxSUT28CTdkoJCpeCiBX0Co7MEYkoLcY0Xk
 4gRzDm158P9RG10sm6/CXOchX4b4JW5QGJ+89zymKWwsXx4aKZHv+28WsRqOcr7GojfbS6sEpm1
 R7tqzouAUbisPevad8Ahb6f7lIdvR4PKETIMCMw9xHA6qYDe2b1yyDXU/bOlKUQWDqSd4sZoa33
 pkhyRYa4VcWRNMFZXkhc8MgobBjahV+4MSJVo2phldSJ8+6hCtpf+PE2f0BjwBPN2Eni3T3zKPI
 oRbIsZE9gVjhtkamEx7pvmq8fO6tKPxWylgusHdqgv/8werkOPDo+4nQH6EjPjuc17Ah64Kk+uU
 0/qvcyzS6J+/F3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IhTxtY3vP1Y4HFJlhgz_4fIzAqkEwlOk
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f901 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=r134EpD-t8S8Nhkp70wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7sj669WnkL1N
 3yf258JjRiaGLb3YVNfajDKhslfxsqlyUUuZdZGl2+on8/kMTOA9PWxSUd12K/feHR2FtOCMyHB
 EinVcVLS5rFtBQVnnqtEUShRWp3rZdY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX1LdfqOdDRr76
 m+zDk2PPagDfsuG2fDuRehPynCxEtA0VRJfO40+CJf7EBLKR5KZ8E/2acbNTbLJeIczUvX5DnaR
 LPEmCofpvAJC9IX93C56RjCxh0magkeLCm8WM/9oif65nAnEgsAHZG4KtWEJvxm+P8QxmTgkeKY
 lQekl8UMvS/CNHBUFxRLQw+NL6QyhKbXXuBY6AedE2QemE5wJJiWR/rfy50fIIs3AjTES3pgHR6
 4M3yBYI27FU4cbOWdHeFtWg3j5dtyuvJgJ6BKmGylx8f6AF6o3iCTnlq0Ylx9H/MglL5mJk68xo
 bpQL8WMOwY4N+9BfBfAzXJ+s7oFWeBUVveTAn8D7wI4z0hXLNXFiXpnwrSbDBbojHcZBtavl0iH
 xlcyAeASMFoIE13+t1iRecvQVqBCmFtqocd7T8Y47NLqOAjNEXvcyQ4fnEzHJ1MVc0/HcMxUQ9A
 EJZWZy2oXIL696X/4QA==
X-Proofpoint-GUID: IhTxtY3vP1Y4HFJlhgz_4fIzAqkEwlOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39832-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-gpio@vger.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB87473B900

The software node fw_devlink support already has its own kunit suite, but
that verifies the fwnode links in isolation. Add GPIO tests that prove
the ordering works in a real-life use-case: a GPIO consumer that
references its provider via a software node.

The first suite registers the provider's software node, adds the consumer
device first and checks that fw_devlink defers its probe until the
provider has been added and bound. The second covers the fallback:
with the provider's software node not yet registered no supplier link is
created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
and the consumer only binds once the provider shows up.

While at it: the existing gpio_unbind_with_consumers() test keeps the
consumer bound while the provider goes away and then operates the orphaned
descriptor. With software nodes now being covered by fw_devlink that would
instead force-unbind the consumer along with the provider, so opt it out
by setting FWNODE_FLAG_LINKS_ADDED.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 286 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 279 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..ad961cf97aee7b1b6e3fb64c9f5d52be25486253 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -3,6 +3,8 @@
  * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
  */
 
+#include <linux/cleanup.h>
+#include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -11,12 +13,16 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
 #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
+#define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
 
 static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -213,6 +219,262 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.test_cases = gpio_swnode_lookup_tests,
 };
 
+static void gpio_swnode_unregister_swnode(void *data)
+{
+	software_node_unregister(data);
+}
+
+struct gpio_probe_order_pdata {
+	unsigned int probe_count;
+	bool gpio_ok;
+};
+
+static const struct gpio_probe_order_pdata gpio_probe_order_pdata_template = {
+	.probe_count = 0,
+	.gpio_ok = false,
+};
+
+static int gpio_probe_order_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_order_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	pdata->gpio_ok = true;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_order_consumer_driver = {
+	.probe = gpio_probe_order_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that fw_devlink orders the probe of a GPIO consumer after its
+ * provider. The consumer references the provider through a software node and
+ * is registered first. fw_devlink must defer it before its driver's probe()
+ * is ever entered, so the consumer probes exactly once - only after the
+ * provider is added and bound.
+ */
+static void gpio_swnode_probe_order(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_order_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_order_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = software_node_register(&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, gpio_swnode_unregister_swnode,
+					(void *)&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_order_pdata_template,
+		.size_data = sizeof(gpio_probe_order_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+struct gpio_probe_defer_pdata {
+	unsigned int probe_count;
+	int gpio_err;
+};
+
+static const struct gpio_probe_defer_pdata gpio_probe_defer_pdata_template = {
+	.probe_count = 0,
+	.gpio_err = 0,
+};
+
+static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc)) {
+		pdata->gpio_err = PTR_ERR(desc);
+		return pdata->gpio_err;
+	}
+
+	pdata->gpio_err = 0;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_defer_consumer_driver = {
+	.probe = gpio_probe_defer_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that a GPIO consumer referencing a provider whose software node is
+ * not registered yet, defers its probe instead of failing.
+ *
+ * The provider software node is deliberately left unregistered when the
+ * consumer is added. fw_devlink cannot resolve the reference, so it creates no
+ * supplier link and does not order the consumer - the consumer's probe() runs
+ * and reaches devm_gpiod_get(). The swnode GPIO lookup returns -ENOTCONN for a
+ * reference to an unregistered node, which gpiolib maps to -EPROBE_DEFER. Once
+ * the provider software node and device appear, the deferred consumer probes
+ * again and binds.
+ */
+static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_defer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	struct fwnode_handle *fwnode;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_defer_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_defer_pdata_template,
+		.size_data = sizeof(gpio_probe_defer_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, -EPROBE_DEFER);
+
+	fwnode = kunit_software_node_register(test, &gpio_test_provider_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
+}
+
+static int gpio_swnode_probe_order_test_init(struct kunit *test)
+{
+	/*
+	 * A prior test may have left a managed device link teardown queued on
+	 * the device_link_mq. Flush it so that software_node_register()
+	 * doesn't spuriously see the node as registered and fail with -EEXIST.
+	 */
+	device_link_wait_removal();
+
+	return 0;
+}
+
+static struct kunit_case gpio_swnode_probe_order_tests[] = {
+	KUNIT_CASE(gpio_swnode_probe_order),
+	KUNIT_CASE(gpio_swnode_probe_defer_on_unregistered),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_probe_order_test_suite = {
+	.name = "gpio-swnode-probe-order",
+	.test_cases = gpio_swnode_probe_order_tests,
+	.init = gpio_swnode_probe_order_test_init,
+};
+
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
 
 struct gpio_unbind_consumer_drvdata {
@@ -310,15 +572,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 					    0, GPIO_ACTIVE_HIGH);
 	properties[1] = (struct property_entry){ };
 
-	pdevinfo = (struct platform_device_info){
-		.name = GPIO_UNBIND_TEST_CONSUMER,
-		.id = PLATFORM_DEVID_NONE,
-		.properties = properties,
-	};
-
-	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	/*
+	 * This test deliberately keeps the consumer bound while the provider
+	 * is unregistered. fw_devlink would force-unbind the consumer before
+	 * the provider so use the FWNODE_FLAG_LINKS_ADDED flag to opt out of
+	 * it as a workaround.
+	 */
+	cons = kunit_platform_device_alloc(test, GPIO_UNBIND_TEST_CONSUMER,
+					   PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
+	ret = device_create_managed_software_node(&cons->dev, properties, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_set_flag(dev_fwnode(&cons->dev), FWNODE_FLAG_LINKS_ADDED);
+
+	ret = kunit_platform_device_add(test, cons);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	wait_for_device_probe();
 	scoped_guard(device, &cons->dev)
 		bound = device_is_bound(&cons->dev);
@@ -350,6 +621,7 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 );
 

-- 
2.47.3


