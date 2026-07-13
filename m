Return-Path: <linux-gpio+bounces-39968-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yqWoE2zJVGoLTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39968-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:18:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03E74A423
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:18:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kEA28Ldy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="IMVbijq/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39968-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39968-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 072563024506
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB567388E76;
	Mon, 13 Jul 2026 11:15:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE18387371
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941310; cv=none; b=C+JUjTyV2+18juloyXSn9CABZMr+ogHy92O25tB7My6zshJbEtf/lrcmw1lCvW9Vu70Ns5oA9AhucYX4CV6HHULuRoLriPAjfGcSGTuwrbcQ61vbTE511Kyw9qQw1mMDt/G6ERa3bPf6r5vDkt2DJ6sVTaywx1briG6aF+74nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941310; c=relaxed/simple;
	bh=uFLoL2fvDTFtaPGJjiYzbRQ0YLyv32CJCl3JGUiomJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agsIyiuLXXkT8qYFMIrSleUprqvyFnEI5XXMN4FRS5v+JANXIIttcTRYhxyK4k235yNO2wg/tT3FZdYRimlv3fhl2qMdT4OgK5FBTYP3qrehCeCGc4T5i45iAu+Gh9Y0Pu8K7lOHxp8vyxcbpkW3vvAQhC0b3Syh/3gqH7vXTTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEA28Ldy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMVbijq/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ucZB1089703
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlTE9tG9MyDB8d3Vffq87ifEYJb3TdmU4EqBwnnxKpc=; b=kEA28LdyBQ3Ug6yo
	21hsuGc9OORE7PCXmMcOrZFD2aSRkngX/W9h4pOoQvUlB3a7NjCaxTdtf5vIPS1M
	gJKbEay9zu+k2gCx8cdEDVvHYz5rGmsbb49n+b4Ar2NU1HQUehZF2uk+e1hwYPm6
	7DJBxtYc7eFJbZZooKH2ZShrvGDx8GSaC6w5AenPzRYPS9ivCIgGsRkWgfJh4dZH
	4fkpbQKVPVwKHS88sZzHFA17x6Ekw027wHyAjgvim3Jj0Jf30Ae529nk+/d/IFWZ
	iQ/dcOSIBnuBjDob2zXQwSagUF4TX6m6vs6ToEnfmxlFP6JTfVL6rQ6Gn5C+tPn2
	xTTDGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r8tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so33318621cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941306; x=1784546106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlTE9tG9MyDB8d3Vffq87ifEYJb3TdmU4EqBwnnxKpc=;
        b=IMVbijq/jZZ08IxkW7vSemhGAH9bB8cLDgGuuWiIXXQ52VbQO+YPjde2ZGI8Z1Kof5
         CwzMcIfcP8HFECyItvgSAnGTxLJkcF8ae9gO1CijkMvfxxYJqSTebTIH/IXomoczL8yW
         qsFH8wJ5TXlHKqMyKDYCSVfE5t+oCJ6pUOLPrkbE736swhzPBD33+QSL0Mz94IkgE+4y
         fLSYANRHk7KESZ0GGpXLqY3A795AIoPoY0moDM61Xz3N1AU6OvrXFEzyaTy6SvBheZ0t
         X6QRZ8nCY7wTXzCj8mLBgHyZl1gW56VTa5iu5WzVB1VmXZqhNEvkDMULFKdkgD3EFnZc
         y/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941306; x=1784546106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlTE9tG9MyDB8d3Vffq87ifEYJb3TdmU4EqBwnnxKpc=;
        b=ftgDf+nMPeEbgw86FvNZY8Fs59Sir0+HFo+qFrEeX1aJK/6DeHNiDXYFVINgalA5Py
         kaQyKnYYH/fHI0IJyGweKB+Oy0jjWiFhVlJyBHHZug6BjRSrefzBH1v61qMx+1FEhOJq
         9idtk1VMzmzKihwx2bav1niAlBi3JC5romUFMXsav3tYl69L+vl2rvNQPTjN8hAmlRjJ
         Fq9bjAYQJwtqwbAzmEDvSD0GEDmiJHgEik6r8AAN8onE+dw+TfOzWgOBD8HQMrJLiOiX
         H2LNgfdh6QfK7mlEiUhak24SMwaPssOjypxHbqG+YmzOp58PWidO8Bws06F7ox8pLYqx
         bMgg==
X-Forwarded-Encrypted: i=1; AHgh+RrVk3yrj/ZLxJGYlGCyezxvjbqI4mtzffdmgX4XPzQzNDwYg9IRpKuNJwLcANtX2dIra9gLSXp9O79b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9CDGM0B+11eTrxIjxNQ+V8hs5yYgWO/XkYotYU+3++do6ydRX
	MgYnQEdkx/mluTSK/7s1xO7GwaDdHZIjdO0F2TCEKeKc6Ooflv6KNdb+P6DlQYkpNzIAHE8NHfM
	LwT7MQ49aWN6pOfxkp2oQ7CLPwPL4qlqPeGHtjZGQdBAMWNTUxM0yQwowiewOmCgm
X-Gm-Gg: AfdE7clMLxiJZ1S/438Knyz3qhnY5pjtq4IKIPyFo2nC/5XHxQikF3NfuPFHUTt0Rer
	mBfI3X6vzUOnVguG/NLs8gx4uAE3UzWNoUuZcPTozVdSJdGktVvdxrOm8vX6BhzBucZ34Y2T2GL
	cYcYmohZe8EFs8btQwscg9aQNi1cet7qCbK5eB4gPy7HITJrER1VmUe8Gwl3YKrd/ombLh4MqHc
	3WWX9ExefJsW/GNcksHO5PBtpI+eoupj6oG2QF/fCZduMV3Tk7AXm/ZXsI1Kx2kgClagdQqYwUL
	+beBkCWaT8pXv+zMJYbqmcsgZ8mBF1DNwgWTC46x7ISarc8opDduAKXQTkwj9hcdMFpiAOJT6nq
	2zmnFsy37dn2BNO0W7KmSedcH4bXcCuxsBI2BO1b+
X-Received: by 2002:ac8:7d0d:0:b0:51c:140c:6893 with SMTP id d75a77b69052e-51cbf058eb2mr82898481cf.11.1783941305977;
        Mon, 13 Jul 2026 04:15:05 -0700 (PDT)
X-Received: by 2002:ac8:7d0d:0:b0:51c:140c:6893 with SMTP id d75a77b69052e-51cbf058eb2mr82897921cf.11.1783941305455;
        Mon, 13 Jul 2026 04:15:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:44 +0200
Subject: [PATCH v4 1/5] kunit: provide a set of fwnode-oriented helpers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-1-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uFLoL2fvDTFtaPGJjiYzbRQ0YLyv32CJCl3JGUiomJ0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiu+nsriE3lOF9zrRtytxUH2n+H0QN6LfRCx
 cLBlDZOkMOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIrgAKCRAFnS7L/zaE
 w+OxD/973xGLRGLOocJWBtz3tDcEyidl5QcoNu1o/BmJ8bmpshzd9DbKi6mUMvJ7cUXUL3hIl+0
 JhTpNCwomo8J6p9mzXG5XpRj7vt4n5gtoYG+xHLxqhJv/rwYZouzzfjgpiWQEBrkXpIpo9p4TCt
 szPq6BBhhsXssuZ+pCQTlJiCrPtqUAOGIKLglxwEX+PfI7e7ebDYsIYBxQQsdulW7WW0SuElc6N
 duy5VViezwsA73FchoFNzNe2MqXmylcMcO4ZJ5X+Lex/FLguDimknnlXQUjxbQqHpPE8gFh5nht
 Yye/mAChuLnWqw2ImH65Z36MaXsQUdeVfr4gE7nCFXmDvUMPVIfnu7m+S1+REbHzeb1rPIPucK9
 8mOfBd5Kv5yqdbnP4x5Mqqd4ceF+Q3ifP8oLJdLBaqMZR1kHhZVf5Q8qeV3QkeNrFDR5km2UfIU
 n8iOlfXAV/e3HoQoTVwkmnsm+0xfaHjQCzKjHtHLQ/gPmNUeChjcIT3evwRV8MnszkjNsswBLzx
 xZcmulKIuzxW02naVlpUZW7cjlmhZtr25cv9vSpYo0qjFNfmn+4GGc3C+Z4ONrHRIrDxQgaGSpO
 1+M2YuLUXh6DRGcplbcrF+q3cYXO2VQQ6Nx7Ip4+EvIoUHu8FlDj0w8fzi85jHvKHm9gahD0nFv
 uCDgq7HGFUdwAKw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54c8ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=nzuXsxulAAAA:8
 a=EUspDBNiAAAA:8 a=5HYbyjZdm2YZoA3apZYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Jn5cl5okm61iLnyvC_SE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX+XhiqctvTkVb
 E9f4lKvFqq72VGa/je9Ewc62sP61OqkdZk216HYyUOVTMnLL2N6hWJYjvkqznzOnFO0Ld5+tqec
 3/VcD08aekks0CY65IVP/jmfJtJDMzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX1vWSARZu6wz9
 3Ob+Nc/e/2RV9lr1NrnBoSXYDAyfTt6DPdOzoHP1xi9Cz97N/atbRoaAoTwQ1DrQP5G86BMbslt
 Dtwcsco5FISQ1Ql2NI0ajidZkDNycsWpIKIEbbtIp4E+dA/ILTolGM2Enjp3BEaVPxMiP/plbgO
 sJ1J8H6LpA+bO/PL9c46e39VuIpkvwAhbQd1k77EqNHCAmwSG5p54BJCJt0XDS7WT/5s7KvNw+y
 GbcRmnR8tN8CMr0EYdI5aE9bmBY0/eiffzeRBkQd1IWNRY4xi7OKs7Y+TXXNPbKDFsgIWhA5pfU
 DyymeAgj5wpQusoWbKM31TO8PGQrCDS8xVHyXQZJ9yD9sj16OwRUvvU9hgXK2eK3nfHN7zDYLlN
 GDmwPjP3qKTC35Df7yCUi6JCx5LoC8gre6ZDXJi40LGxsStUmvdBijbupKE05wIKZMC9TIgKQOU
 sZpgKV3dooo0tRCiPBw==
X-Proofpoint-ORIG-GUID: mGVho1a86x3zwid2--bUTbJu-eMcXvJn
X-Proofpoint-GUID: mGVho1a86x3zwid2--bUTbJu-eMcXvJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39968-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9E03E74A423

Provide three new kunit-managed helpers for test cases that need to
register/create dynamic software nodes.

Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h |  29 ++++++++++
 lib/kunit/Makefile     |   1 +
 lib/kunit/fwnode.c     | 146 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..e250bb87e144c42b1a7e439947a224f50a253179
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers for firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct device;
+struct fwnode_handle;
+struct kunit;
+struct property_entry;
+struct software_node;
+
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent);
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes);
+int kunit_device_add_software_node(struct kunit *test, struct device *dev,
+				   const struct software_node *node);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 2e8a6b71a2ab07a738964a7ef0f442fd53e085b1..204e02b10eba1030c6d511991fe2f6271de64603 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -11,6 +11,7 @@ kunit-objs +=				test.o \
 					attributes.o \
 					device.o \
 					platform.o \
+					fwnode.o \
 					bug.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..a58ce0984d76bae1072d77abc26f4cd516e487ea
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/fwnode.h>
+#include <linux/property.h>
+
+KUNIT_DEFINE_ACTION_WRAPPER(fwnode_remove_software_node_wrapper,
+			    fwnode_remove_software_node,
+			    struct fwnode_handle *);
+
+/**
+ * kunit_fwnode_create_software_node() - Create a kunit-managed software node
+ * @test: Test context
+ * @properties: Properties to use to create the new software node
+ * @parent: Parent of this software node
+ *
+ * Create a test-managed software node and return its firmware node handle.
+ * The software node is removed after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the newly created software node or IS_ERR() on
+ * failure.
+ */
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = fwnode_create_software_node(properties, parent);
+	if (IS_ERR(fwnode))
+		return fwnode;
+
+	ret = kunit_add_action_or_reset(test, fwnode_remove_software_node_wrapper,
+					fwnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_fwnode_create_software_node);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
+			    software_node_unregister,
+			    const struct software_node *);
+
+/**
+ * kunit_software_node_register() - Register a kunit-managed software node
+ * @test: Test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the registered software node or IS_ERR() on failure.
+ */
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *swnode)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return ERR_PTR(-ENOENT);
+
+	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
+			    software_node_unregister_node_group,
+			    const struct software_node *const *);
+
+/**
+ * kunit_software_node_register_node_group() - Register a kunit-managed software node group
+ * @test: Test context
+ * @nodes: Software node group to register
+ *
+ * Register a test-managed software node group. The nodes are unregistered
+ * after the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes)
+{
+	int ret;
+
+	ret = software_node_register_node_group(nodes);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, software_node_unregister_node_group_wrapper,
+					 (void *)nodes);
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register_node_group);
+
+KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
+			    device_remove_software_node,
+			    struct device *);
+
+/**
+ * kunit_device_add_software_node() - Assign a kunit-managed software node to a device
+ * @test: Test context
+ * @dev: Device to assign the software node for
+ * @node: The software node to assign
+ *
+ * Make @node the secondary firmware node of @dev. If @dev has no primary
+ * firmware node, @node will become the primary node. The software node will
+ * be automatically removed from @dev when the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_device_add_software_node(struct kunit *test, struct device *dev,
+				   const struct software_node *node)
+{
+	int ret;
+
+	ret = device_add_software_node(dev, node);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, device_remove_software_node_wrapper, dev);
+}
+EXPORT_SYMBOL_GPL(kunit_device_add_software_node);

-- 
2.47.3


