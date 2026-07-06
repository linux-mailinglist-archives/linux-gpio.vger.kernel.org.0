Return-Path: <linux-gpio+bounces-39523-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMPNJwKpS2pxYAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39523-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:09:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA467110E6
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:09:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=njSdUWnw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fYGPShAV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39523-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39523-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA853303EDAD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 12:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85F243B6E9;
	Mon,  6 Jul 2026 12:54:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EC438490
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:54:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342485; cv=none; b=YPKtD/dH+YjNhckPjC35vp9DknFXADcMBwbxrYBTGRHHMHDZEkdagu2DB3xqtYZh7rbS+396dZmswhCWe6ZM5fUJnrh1Dcj48TAIiJYKaIKX8GbpCDzpVKXsCyi/goHvAoQ42NPXa9S6h+/Ckw/1G4Y6u6q2RXJkIvwHwwbhdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342485; c=relaxed/simple;
	bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7e3vqN3gBcKWnRYYEBic64bBBQV9DAKij7C0Ad8hTizvLF5ynTnxovoFg9G3xXPsRLaOr8K64Gxwll7FQQNHKNCBUbKtlDUxuszUebOMzUjOj0qLasdShiiNcYD14m4FqU7TqMK9JfLkj9FZoGnqs5411wc9IVTTQHBZrOKQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njSdUWnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYGPShAV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDIS366713
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 12:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=; b=njSdUWnwl3xuSbj5
	TlAvRuKwzHIC+phu+eifbRMk9cS7+qenMJ5P0s6paHP1ExwiBWnHF2oEDUqxatME
	llJ2EEvmKmWsVGHvduRmHzvYhRpLmyFW6Gdw/s+G1IZ7qBFumzsPMaxeLp5bu2nI
	6siQ/upDkAB6yb4WjtVNPqd1ZpFOGpXUgnB/K7+3SD68QPiTT2KfyqWumD+l+u2J
	vp1SPllXZedjBHwXYNWy5blLPAm02q8wFZ5kbP3PMBTOgUKi8WAB2BaK8aCay0Ic
	BSG4WTZnFf7l3acS6VgmCtgFJCCCW5wxsL67wDCp8cp6nPDIbT0hMby+UmyYMqRA
	dPfFPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urxt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 12:54:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e61b38eddso543586285a.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342482; x=1783947282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=fYGPShAVeGsaNNyGhYbowedrBiKcZJYvBjiPAyXdCkHvWAP44Z32vmPtRkMuc2z8HN
         G21S08jACxx+aXhSwCNkKNIX32d5xdTxFICHN6IyO0HyCxA0KB2jbTGJi8QtPZxQxRMf
         1azoTpCNpTH+d66ijzSUjXNoMKjRPh8X+gaYUxcUzbbQPhSMqwSSXHXn9odkkT1WQlmf
         r7PkFDze3tu3LyhlgJ39oOM47hclHb9PDCVEUZaTIF23ZMkVCtEhPhoIBbGxGEXmIKtX
         +jz2KSawLHJGkppkko8iJsSV+NJKwfvutK4Bpqa6ntI2Xo4HBa9f/4fmswf3y/mJcj0g
         4ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342482; x=1783947282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=cBCkWkzwTkgewagGxfHJcWYqeIxJw3CkpncdxeKlTGCE/r/a0HLFlKaNh0y/v+WISf
         PTbt9CDBBczmM/3vMg70095tmxohWvwsFZCM+In8b6nQP+LxThIohSc/nwHw0l/pZcIA
         5f+IrVPMPNYwrfKThKmHo06ctmMy9AblIhJfto7S/zWq8qknr/pdevPwq2Myl97s/ZiT
         D3Vj2uFIFaXdzAue0oQhLfu7HkaKDGcNawVn/jxz45WdvBmUmPzAVej5SNmk7TsSrhEL
         wqqv/InK4bgshOh5TngNR0VKzFnaayd20Xu/SCZWXLezyjAnqvpIsgh5htjoXqEdzaev
         ndeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM7xt20LFYRIns6KDrDjz8js21nZjlC48rRLWrTYOBpptoYRiPSdti4Zqn1hHfmnMADZm0LWRRhli2@vger.kernel.org
X-Gm-Message-State: AOJu0YxxvC49Pvqs7c0jEjX4b0iXnfZ6PtgVofNNyv4iHiv1YWaBzdQo
	fFes3FvfMU+6sEK2UqFsDiaHFwVEPe6/l6DxF1CINaPU3sEGhZbTQQCfA+JXF6CD6uoTxmsaRHy
	dCQlkXBgaUoddxi8Uvube5EfGyvA/XlWF3ASG1FJ9PAG2qmJnkzE/gvqbc/5YNxy+
X-Gm-Gg: AfdE7cnDhzZXdxvwEWz1VLibldv0/LCFB9DmMRURhl4tw7GNsdi7apv4F+GAAlhjVrl
	1ivvo8yGtPdqfC2AYwZ3nVkb9KHXPIUd3dgEm6pfm5RyL4oCZEhxFM57ceNZcB5+j2ULioVczLc
	XefLUVQ6rwJVQESkflR1JfQ5ucldRZFE+HmA7mw2kEbczckvykpeTKlVEE3c6MPZRkbrUhk1am8
	Rp9M3XHG5SIQfTyFDEwfk8IaeuB9vhFMgplVBKR/yBTO/0phmSCPgF5giUiI4HWqASRIxgqXSvA
	9LjAx3n6FO3FKA9uDYoKQu9M1Cu4IUibPW0j0y7VezxWU0lO5OWYZLy8iy70CKYWROcWjPLKsfX
	A70Q7C2+f1Lf9t0FTbGDa+voZVVum1+XkU+GzMDM7
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr54650585a.61.1783342482383;
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr54648185a.61.1783342482039;
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:11 +0200
Subject: [PATCH v2 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-4-f39b09d50112@oss.qualcomm.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WGF3whIW+RLqDAnJl2komv2tggoOcvqqnfv
 ocHtTbK2ZeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulhgAKCRAFnS7L/zaE
 wwaIEACE9xjgYSFMqIxeccykET/8UUPaY6JmKvllSX4L/pZkWNnEIoZlQYLc4yR+N/l8RSK/H4A
 CeEsKYUFGtKROlOlbDIYNRUI+z/sod7oTEntYOQ9n5+KVIanY7BC1VhFbF9VFyIycnu6DyB+IP5
 C/s60NpJgqoNBj9N1ZYBps3/n27llPa+Q+v3iNGh6/EgEEW0tCOuOOuHapXNuAN+7O/3pH/2kc5
 UyB60g+58cc1g1T9RZg+zhQei7eyYpjWj2QUc7/nCCgSf1gnr/eV6PyvmnMPW7OBX51vPhwJl2b
 1C/voXGoOpuDkFINlJ8Z2QI7NTF2fgHfOUei/IGlzNofuaEZ3qCqmUcPFvzy1xpHCOCkiSw+QCT
 1yYZ2fnx3Yc6hyFals3+5yytxFajc2rZfz5yg4A7TMB/+XS6us7riipgSe6e2Q2izjOc7pqV/Qw
 cB3JWo4TRsKvxyxM/+Za2P799buSsRIaljMqnqXhav3/vlZwFkyVzqrq5xZ2Tvzl2gcbhfB5y6D
 u/UjA2HyqLvtPX2GuKFyupLO1ME2KOxhHybEcLSkDhhQO8qP9lwsyEG0dNSrolNwwyxfVRHwLo/
 JRubEwo2kDbojKzthKid8G9zvU9sFnV0MwLpDSZpvSxz6MbTj/v2BQg14gi9/vAP3z3sQM7DEaL
 MiNUR9F+C9IQykg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ieP4btXZwqRKLnwYz_z2go7_a8RQHMqT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX33aXujcld1gz
 92QMvmOZ2S1zVpgz+4e8gAmR2kIoRxxEYdZvR7IaVGGq6UfzsrmuGXuacwWDlPylAuj5ibBNJOE
 KazCORIWO0WDNWmnYtTeBxYzakWC4QA=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba593 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfXzJG97iRywWvX
 e7ZAnzZMMc0V9+50tQud0MUFEVUREmBeuPxadtAUYnplOe5kG/qL1oaOcqYjA9DpwCP6qibY/JF
 BlJblc/UMaKoUYIMPEh+P+RbJo2spDdeFSK0r0cPntlFXHxKxwd7cDU2cTN8WRZlig/asALIaMX
 5c0NZsdEFtOLnlht6QEgiRq4/KX8yCzmyQjnk2qmKDcWr7p2YWcBRwvgwzoHNcQxkojVMWhY6kl
 GJ6xOl/4MzoCvJGzmQtpudLqBYjVQcAxv2hSyKaIRfOR/EDn1AZRymeNlb/6224QstO5OD+mNOI
 HoZC5s03Hji9w+WZhbW42tnCwSnJhoc6MViBiWo1QwUoo0HKIOaHp5EL1F3XTRXsKnMbwGCYUrT
 3ngGgX5YWB4BQCgBNYOIyf5yF4yyEUY7B8xdJIin63rTbONXYDiOYNKwZ9N4sTfdgfVr3ERoWvw
 XZ49AcT/FJu+rQWcm5g==
X-Proofpoint-ORIG-GUID: ieP4btXZwqRKLnwYz_z2go7_a8RQHMqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39523-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 0DA467110E6

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7741614c941ceed9e46e9caea72bad77cfb7618..da886aa69f362f4cb9dc529a26f8dfc67649d7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,6 +25101,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3


