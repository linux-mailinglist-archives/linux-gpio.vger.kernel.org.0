Return-Path: <linux-gpio+bounces-39969-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m89kGs7IVGrOSwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39969-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:15:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C77BF74A37E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:15:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RYh6cDyp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SvfnpIz3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39969-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39969-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E893302E0D8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2CF388E68;
	Mon, 13 Jul 2026 11:15:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346DE37AA99
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941312; cv=none; b=HL70LaQg35pY6H6vQ8iaOtWBA+XLM0JwmxZdvYI0bWNbzcZZ1ZU9bAn3XRAlqI2g0RgoJJymerRZlFYrJEO4vI7ynOoXhTcBpVKubZvOusjvn6pNJcEXdXJjtWZrteEFyoBu+8Ya9xkOWAAIFZtt2EcQoXP9RhUZWllAdh5l8jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941312; c=relaxed/simple;
	bh=O9NkHL6JYILIp7mfm0RnOgr/0S6YPfzPn6jbv5EJbjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFDj40h0CR/7a2ENhk4pSI1XM38qKkmMP8/Via/c3GHGvFO3P+oeSS1af0nAMbF8LfCkhrehBCKAu0OJruGO5V/zlsr2ZzR+qyLFoBPkPYNapVgn5tGw1qVyGXEV0CCjtwS1dpXTsku/yGb1hBISAiEJmnpsSlkmqg0ToXCjSfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYh6cDyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvfnpIz3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ucCV1089702
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okGnys6Dq42n97G+YBE9VPTayEfByn7CtWc7od0TY/Y=; b=RYh6cDypsF1bP+QG
	Z4qVwPP2cR80gKUg1fPaK8tCo5IUPTfgtNOdxx+2W7pEdbGDur+HOudFcd4TDtbh
	br1ltp21Qa7t10NW2C13DhyQTGwIK71YNSCB1xv2dFKwz626Uxpvm49ksJixSCZR
	JV1mvp2ZRzKutzAqRYbuxK6FXhJQiyLM9NewJ++A4ctoJrtyQ1e5XAzf0S+XsrS4
	AcXrWrf7Y6eDycSdp0Bt1Nce1QdWrW+WvoltYjX09lzXXwT3A39XFJTifJsuHB8d
	piaGTAp/oXfq9Ji6N9qRkptvEKBb1dP3j4qVhDQXFnZxSo6hPRpF3dW+rIC6WNbx
	pnKJkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r8u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0ab07320so37664081cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941309; x=1784546109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okGnys6Dq42n97G+YBE9VPTayEfByn7CtWc7od0TY/Y=;
        b=SvfnpIz3gUQR6aUwNSQPUPAvk/7HjD1IWvbxWHTJzWI9KSYtl0YB5Jb9wcNcXpQsyK
         Xp/VY6G6BsSlteDhOlZkQA2wo3WIEm08z+mthjVsg9XWM/cWq7ul77Yzfo1g0daXlkqg
         vvvkpH37o5P/n6PlV/FSXVgcwCkKq2Ctn1G/cuEOPmIotKNCLAq5S3WRujfg7wW48Osy
         Hkg12R0jP0Yf75TZcZzcwFdV+eI5FYctZYXzKBngF9z72Hs7pZ5XlDs5txKJfwCNDspF
         E2QDtqqkuj9fB9m4vLvY9llfuv/B9R/eNvbOaVpNu7sQ5Uuvfa0nFV1IeisJQ4UHx8AQ
         dqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941309; x=1784546109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okGnys6Dq42n97G+YBE9VPTayEfByn7CtWc7od0TY/Y=;
        b=jFWtpl4oPjCQ/hRGvBY97EWLJqmiQKlDOmzqL0eXyqyBU4XGzCvLgd392ej2JlL6bJ
         3WkP7JDqVyYBA8wi4MNLLkP/QXwYHwAzr6V/Y7m8chBjC2oBhhDAMndR6pKmaZ3iWqdc
         SbgmE0CbiLCvJ+kjSTn4fXWufnlkyfeVAugy+XcN7p4vDtzSsNJRVnYaHlXPedLzpZQ0
         Gy1MROeidKMNoUUrkzfAPpQ7y9dwvd7u0amqnz7rHN+CyeFR62t6VrAStjpAkO9GMbDp
         UsSWZGbdf1/MStHIAfH43FjAtq1BGHqnM+9qfbwR1citdgpp4snd5yJeI8F+sp/t+UNO
         DWRg==
X-Forwarded-Encrypted: i=1; AHgh+RoHO6HuJgB/lsvhXrZUkpgHmWpOyztNwmZhKeC+lXCZ9tYCicBGfp8Ig1EHq/ZisA9KEgcOCGTPosZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMAHsuBFYrD3UmGScwKVrZJitZWgrQ+Xy4sv27Tad/MQreBGKV
	2FFbgAmLPlvHfTfyvlHisU5sUVvnFBWcSQZrXsQv3gIhY1TWOD4DOFTQ8InEqzEl3fyhWL3ayD8
	VvyrU3rX4EPhGrr8SFN9YpCNPYyIi/98YNTT6ifgCi29vVx4acvRxjcXXPRcLDSvv
X-Gm-Gg: AfdE7cmENDQqZDXBSLXA0NfpVziXtxyIg1SGxd7/fkXXQShMkBVhezFKPY4SLCQRZv6
	PqhXML+dQ9K5Qcy+yOV2PzOl1knAeIE1kLnb43VUNkftpiyYAZCP/E19TZnGg7Lki1bKIcGlLW0
	foWS9vdeov0uDw3nlM16CyICPcDWsmzCFEm7vBRTsQel4F/9Cn2bk2wF93BMDTfAboRl88zNS3y
	UBXcCkPHlD/xyoUp8frzhhyNq9qkiSKTzHRZEpS4nnKYvwTBwcKxZTK9JKfSkgpBqhrkFOBLesA
	ZSa8n871zTBJ8vm/SE0x+D1fmeQOeChdGeV0FRKeRVAFe4IWeuj23vV/BQ0gNfcy3LMN3U3VgR9
	Gid+QAFEwXcBSY8kPWdvOmQEzz76YHv10jQ6Pvk8Z
X-Received: by 2002:a05:622a:1828:b0:51a:8c9b:649f with SMTP id d75a77b69052e-51cbf38ef7emr84447361cf.67.1783941308468;
        Mon, 13 Jul 2026 04:15:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1828:b0:51a:8c9b:649f with SMTP id d75a77b69052e-51cbf38ef7emr84446991cf.67.1783941308020;
        Mon, 13 Jul 2026 04:15:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:45 +0200
Subject: [PATCH v4 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-2-d4f2dee27ad9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O9NkHL6JYILIp7mfm0RnOgr/0S6YPfzPn6jbv5EJbjU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiv3n7DWmU3bTgDtMHhn+McKk6aAxv9PFD8+
 L/kGkkHH4mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIrwAKCRAFnS7L/zaE
 w1WRD/0fycoaLESQF+jB+f8IxtpFfiLvdJ4cwDu4+Kgo2CXBydcgbhsuo1LEVLLC4eTXh4qJuSW
 vApZWytxW6u84Gd7RM2JZAhrrfFH7sgRGvgkn9jSRG/kwqWkq4QrSm16TPglgLGyavF2tcwV3JP
 fojBN2IHhuKKAjC4IVvuV/GuJvRgQHaObu9v0SJcNT8WNjUkQU5uC6Bs3p/shCnyZcuwg17Q1Lh
 fdi+CpEr5nFWo2/g7j50IVzqAzswifIj9kPn0pMTuU7oVo1zNjrw89jGpoYYMGYP6WoYvHzNZkE
 ylnU9iiVIo4cBd/8oRK9V8We2blZBWx8AhhLXGiicXDt+mbJxmxhkx9kk58vMSjXhejoqa+B/5r
 /bolt61WnOR0t5DQWGt1raUCyJoNV8Lg5/g1NjvAtjUqZVBetnpHwFYUV3lW2VQ7v1fF/uOMKJK
 8uZU0ZqVUXOKd0gRaaz+e5j7QfOqwkXVjtnkxo59mY1TJmfGR+7udlroTFzyY8dL0sNw99k8a35
 0J6Auidrd1W+GLC9m6PGDGorsJBQin0gFlKR5mK+hZujM1D8+biy4yUcaFNGDDbdnXrbF4Zo+JH
 CEYzBnKn00I9as4is4jyBwNZIQckRnXjKh46IIROikmeDpe1hiD6ae0LUp1if2DVhMB0BaUGKAW
 vyjg97iHRtLLOFA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54c8bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=fLzRGSmVK1lo7flavS8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfXwDhOSvROjUQq
 swdWfz2SeukxkDHRkPmbgQ+asMOGosuPDMaKlfwDn38+3YPXcCeQ+gGyziwFPJDPn5Xc3gNGYI8
 s9tni46Okz/66HldWuanCNK+OPxKJMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX3scvjoeobzw7
 vPq880Li34qldq+Y+hM3OwDPf6ojAxhJEh1YzK468ZOZvOTkroI7gEOzhB96qMD2RhWgUcmJJu+
 EWT8d1qMlmAQ2qlhQRzLTfdWGGIri5mOsIX1knFc4N9PdeT85IUo5CfB+g8TLqRmk+ViJKxm26B
 z57Q2hXKO77Kw7vby/oqJylg8IV6ShC8U143oFjZlodBgaCof2SvQ453bHHXZqkpzPF5SH6/Vpe
 ocO5HgtYY3j82jqQof89latUAzH8lKPC/jUAQorgeJAcn8F8z7EhveTY/QQD/e8Zrt6ywi0mr6Z
 Of6liB7Ano/HEs8y1hMEjAgOWrDJHMoUzHlOXqwLBmy+bDOLig+6DzGrKWzjIoNS7AiUCjFM1Jm
 GPCXgc+o3p6eczLs7zAPfR91C7Yo0u4PZGmq40zC3RM3yQqhYyzCW5TfDqjLC3fLw9KvcLKRvTE
 uHQ6tdh8853mGFg1LgQ==
X-Proofpoint-ORIG-GUID: miqhEJJXVnWgKG4Zbssh3g3FK3So4Art
X-Proofpoint-GUID: miqhEJJXVnWgKG4Zbssh3g3FK3So4Art
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39969-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fwnode.dev:url,intel.com:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: C77BF74A37E

Software nodes can be used to describe supplier-consumer relationships
between devices they represent using reference property entries. Unlike
for OF-nodes, driver core cannot yet use these references to create a
probe order that avoids needless probe deferrals on missing providers.

Implement software_node_add_links() modelled on of_fwnode_add_links().
For every DEV_PROP_REF property we resolve each referenced supplier and
create an fwnode link from the node to it. The driver core later promotes
these to device links and defers the consumer until the suppliers are
ready.

There's no allowlist like the one DT needs - devicetree phandles appear
in plenty of non-supplier contexts, but a software node only carries a
reference property when its author explicitly points at another node, so
we treat every reference as an intentional supplier dependency and link
all of them. Graph "remote-endpoint" references are skipped for now: they
go 2-ways between endpoint nodes and would create graph cycles without
the port-parent lifting DT does via get_con_dev(). References to
suppliers that aren't registered yet and self-references are ignored.

fw_devlink resolves the supplier device through fwnode->dev but the core
only records the owning device on the primary fwnode. When the software
node is a device's secondary fwnode, mirror the device pointer onto it in
software_node_notify() so the consumer can actually find the supplier
instead of deferring forever.

While at it: purge the fwnode links in software_node_release() now that
software nodes can own them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..1f2315858cc3e04c7ff197324f1862c32a2ffa31 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -699,6 +699,62 @@ software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int software_node_add_links(struct fwnode_handle *fwnode)
+{
+	const struct software_node_ref_args *ref, *ref_array;
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct property_entry *prop;
+	struct fwnode_handle *refnode;
+	unsigned int count;
+
+	if (!swnode || !swnode->node->properties)
+		return 0;
+
+	/*
+	 * Unlike Device Tree, where phandles appear in many non-supplier
+	 * contexts and a curated allowlist is required, a software node only
+	 * carries a DEV_PROP_REF property when the author explicitly describes
+	 * a reference to another node. Every such reference is therefore an
+	 * intentional supplier dependency, so we create fwnode links for all
+	 * of them.
+	 */
+	for (prop = swnode->node->properties; prop->name; prop++) {
+		if (prop->type != DEV_PROP_REF || prop->is_inline)
+			continue;
+
+		/*
+		 * TODO: Graph "remote-endpoint" references go both ways
+		 * between endpoint child nodes and would create endpoint
+		 * cycles. Let's leave it out for now until we have potential
+		 * users.
+		 */
+		if (!strcmp(prop->name, "remote-endpoint"))
+			continue;
+
+		ref_array = prop->pointer;
+		count = prop->length / sizeof(*ref_array);
+
+		for (unsigned int i = 0; i < count; i++) {
+			ref = &ref_array[i];
+
+			if (ref->swnode)
+				refnode = software_node_fwnode(ref->swnode);
+			else if (ref->fwnode)
+				refnode = ref->fwnode;
+			else
+				continue;
+
+			/* Supplier not registered yet, or self-reference. */
+			if (!refnode || refnode == &swnode->fwnode)
+				continue;
+
+			fwnode_link_add(&swnode->fwnode, refnode, 0);
+		}
+	}
+
+	return 0;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -716,6 +772,7 @@ static const struct fwnode_operations software_node_ops = {
 	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
 	.graph_get_port_parent = software_node_graph_get_port_parent,
 	.graph_parse_endpoint = software_node_graph_parse_endpoint,
+	.add_links = software_node_add_links,
 };
 
 /* -------------------------------------------------------------------------- */
@@ -787,6 +844,8 @@ static void software_node_release(struct kobject *kobj)
 {
 	struct swnode *swnode = kobj_to_swnode(kobj);
 
+	fwnode_links_purge(&swnode->fwnode);
+
 	if (swnode->parent) {
 		ida_free(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
@@ -1105,6 +1164,17 @@ void software_node_notify(struct device *dev)
 	if (!swnode)
 		return;
 
+	/*
+	 * When the software node is the device's secondary firmware node,
+	 * the core only records the owning device on the primary fwnode
+	 * (see device_add()). fw_devlink resolves a supplier device through
+	 * fwnode->dev, so without this a consumer referencing the software
+	 * node could never find the supplier device and would defer forever.
+	 * Make fwnode.dev point to its owner in that case.
+	 */
+	if (!device_match_fwnode(dev, &swnode->fwnode) && !swnode->fwnode.dev)
+		swnode->fwnode.dev = dev;
+
 	swnode_get(swnode);
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
@@ -1127,6 +1197,15 @@ void software_node_notify_remove(struct device *dev)
 
 	sysfs_remove_link(&swnode->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "software_node");
+
+	/*
+	 * Drop the device pointer mirrored onto a secondary software node in
+	 * software_node_notify(). For a primary software node the core owns
+	 * fwnode->dev and clears it in device_del().
+	 */
+	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
+		swnode->fwnode.dev = NULL;
+
 	swnode_put(swnode);
 
 	if (swnode->managed) {

-- 
2.47.3


