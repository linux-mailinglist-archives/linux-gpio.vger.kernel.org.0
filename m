Return-Path: <linux-gpio+bounces-39521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CmJFBC2wS2orYgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:39:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8837115EC
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pcsl5Tz6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IrYF7Nro;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39521-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39521-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DCA6317926A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 12:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4D343846D;
	Mon,  6 Jul 2026 12:54:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEA431E7A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:54:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342482; cv=none; b=JGPFbBhGg7EQFazXZkUMH3//FwxwrUOhZTPlwnmvqBi04MNRHnuQ3KHb9y5ErqG6I5oc3Rp423FXRwVSmC7yppdB5RXaytMmwOv8Xc2Gl9M4jinE4o3Fu8r4Mbra4A0GCbeRHqxSNK11b1nRVlMDXkW5CKoOCAjaflova8O3wwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342482; c=relaxed/simple;
	bh=GJDbWtXj9ZhW6DQ5CNbSiVpJMnaQQHbolc9yo4vLUbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYHOL6j/cDwlwBFyoWQCX8HrAOPbz1yUw9HnRsfkwnK/M3//BwHoygus5xaFKyWbFmSMo853M/wH2nBUuJLRRrvi+15/A/fFCuxLLUduCMGdCSSa2aGiVBxQIwT/porcCFRyulWT9VG5Arcg2kzhPRUuBIKoRle/L2db7IzOUXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcsl5Tz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrYF7Nro; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxGAG387186
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 12:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xwH0Bx09wM7eaw/9z1uR1vS8Ka921p7XRleHkZMrv4=; b=pcsl5Tz6FuYmQbGZ
	Pl/grkG3dT3L/nTpSIP/3zLMQFZYBWOqNipoMr+DJF/0HpEW4uaqWzASEb4eEAf0
	TMn7i1M2soi7s+TAkXkooMbKD9KiZZNskndghhE97G2HAEWpYMU6OPVf0GslQe2l
	neAHpSX8Li7mUMecrWVkfKCrUVcm2YKp3Mq+wATu1SINekC88OjUbAtdy2uVFUdG
	gVflQaU4l+Lj4j4mSR10htUjXPWHBL/ie6vMcDSAgWO46I60qx/TbDOepsfL/MrO
	scX7iGXfoWhLEriweQuAZuXPCGL5kJgWrmKiV9glO9hti6m+j8JdufNkGwq7cduA
	JsNHVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0ntf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 12:54:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6ed4fe99so511499485a.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342479; x=1783947279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xwH0Bx09wM7eaw/9z1uR1vS8Ka921p7XRleHkZMrv4=;
        b=IrYF7NroXH6LljVQijhS2RMdo9Azys/FJt9qoCJbvXPx4Ly7voN51K4UlNyqgbEZfZ
         FkWFbu1mdCmqLPMq8dMDJ41sHFBfXJs7ELXUu5hWL9uAMghHQSHVESkr5gaBIHmvOZHY
         Es1XB5MiBE9HkGKSn2H8lkKQP16j4TVhybpcH+x/mAhk0+5T+HU3Q5APTi2Y+KH9B8C4
         8qIdRlaW1R0d4u+CIMWt7bemafiPS8tZ8qNsTaRCZTdNYpB03YVnfdd/KwuE8rcgisdb
         cUgLQnbjwg2R+6BMvPlqpjUB87BlmqMc97q5EdhbIXP0zNjgJydUOBoIi6Sg1n+Tys+w
         3Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342479; x=1783947279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xwH0Bx09wM7eaw/9z1uR1vS8Ka921p7XRleHkZMrv4=;
        b=jVfGKsW0PqpzOLMwghHPWipvzkrd349cHV3jVmPbzbDa7g7etu3RgKiM6tJZf49utp
         pTX/P4onZ+CXi/Jx9Aja65zks0sMW9T4kdzmXrXJun/Be5L47bW6oTZqTpxDLqLXcri6
         oLeid2JKcB0s3zDStyd54ICzja6ntf0rKWPFnOsamks6cMYDXR4f7bQ9NxEnfhMGn3F4
         LBDzn0WcK6Gfef/KhHfoRfaeYLtJw7U94sZUaLnO3vNTY4qMCcPAMUnW3dIqhUI7UJkN
         DPY18e39ZGfNKeI7bzrtzBBaf1HsGvOxMAciKG9XUc4ZmaEVnGCCfeyFAITLMkAKuXh+
         WUaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh44TT9vGSniAoKKeEZz0k/0MwZmD7AA86gRxyh1mpXwI0tQnbXS+tQ+JgOwW/q/GvJkMP4P2oLuRk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sJ39nmkbA5zTOxZ0yeyZHcyqBRGadfZAzjewjJaZLk4jpY4v
	oOHj4gOjmvcBprowYVyvg/L7EcaP72SLLxgT31QznRy3eugWOmVN2/Aj0ELKMb/pmfMDRFvNea7
	2UYWdrqEp51BSab20UXHeLfOjip4O3ZKWwI07dAJWjXdcBCuh572HjhZkcRk2uLKp
X-Gm-Gg: AfdE7cnjiFTz9iJDk58h/IvHYitJzHQbEi9apVGawkPivGYX51xECtl8AeZvBZdrgEd
	0ThdO2WTd/pSlNFGX7cSbZXvCe+dcOXbRqdqdolhRm4xqNwuD/OMV/Rb4NTQ80sakTpN0tULaVH
	GgniPV6U9ERVyOWobSnRXksOxH+qHAZQMdHpUYHpyHcjaoizpzR66scQNBbjT+2J1QD49I3yC5s
	9T7/riyvpfTkHfCYTj/YtBAuJYZSBfXrb1qfGk6eO69ZjgDrDvKxDIfyC2kBmTqTDp2dSXDOcKD
	Ffj/xQrasLaKRrXgldwzXGag+kCCn7QQ0qam58wNTvnfrYVC61IQzpMmrBtO2U90nfnurR+YVGl
	EaUvnZEixa0CbBmLLq6PG8sQOa08hu+KQHj60RC2I
X-Received: by 2002:a05:620a:45ab:b0:92b:6805:91b7 with SMTP id af79cd13be357-92ebb5ab797mr59040285a.63.1783342478605;
        Mon, 06 Jul 2026 05:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:92b:6805:91b7 with SMTP id af79cd13be357-92ebb5ab797mr59035485a.63.1783342478103;
        Mon, 06 Jul 2026 05:54:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:09 +0200
Subject: [PATCH v2 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-2-f39b09d50112@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5911;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GJDbWtXj9ZhW6DQ5CNbSiVpJMnaQQHbolc9yo4vLUbY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WDdtOFStOHjpQkjs/j5JIUJEmU1M2ZH4qNl
 x4Dl6VOcZSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulgwAKCRAFnS7L/zaE
 w/d6D/wJSATxv4K5AL6hRe3ClxpHbG6tS5ckmZr0niulBSKvlPfKJYnF0sPpAX0DgnPtolRsNj8
 R/O1VeIrJcWDjiFoPtimC+hgXpdKBy1++MtipDSVxov507nwH2YrndmqBtLcg7z6ltYLECa09s8
 C9w93sQfnDLn70Z72BJkcRM4LRkwuigfAkL7n2bLyWor8OC8j+C7AB6DaEDSX/jZUR3PnS7QbyW
 W53hVVs/AUrMhSM/7nGuMNKAQXnanKmYvu82bWiCSCso77dqat84XxKEToxMYScMAawyKbMeSnp
 41Nz1Ll9R/bucdoSCnc9YfZEMHYSUq9/6kvw6iYt8Fn9e9y8Egwe+RsbUMoSdiMOHXenPKgD3A2
 80RzgYjazty+vV99UJtImIoRZTM2yfY6NvL3eJlOeGY1SQRDkBIkOU7FJ+xYeuRJRPjGhn6Yh9o
 E+KBW5yjGmzkf1YyxoY1agg5TovE5X2bFX+wPlkiRPS0ukqB61lBpC4qxcdSy6y0r0fPUDYiPkN
 VEkwIfkJKOMIgTNO4aWKkvk6541vq+pPiF27fwJE2tEKPz7exsgtNmZFD2ODXmUxzpsgi9zZ6F+
 ic9GGG2AfYfLO4inIICa1Y3OCxfCoY7SzyyDElCV54FZEF1Jg+GERo3uIqpPQ/Gg6+NWi11KBIe
 Y5eW+c9T9rMELCg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX0gWdA2norK2V
 /qSgVWetcyvadY+KmclEJl/UUMq0bGzvDmTEvS/3opGc6NE8/qG4GiG7fC/kv4G0P/LzjqIy8jL
 h/aB3Q6WxI2XsJADlet9Jl+lYLRsozYEq6Kb7nzJJcOisLJw2Bfc48olgBSgvPlbnfJjbaNWP+g
 iNv81MnTOTmCzqRn5bS64En7aS+JFl1RearavdEr+PS+TmaMJASxFJp+Rni/NzOjKKlcNk+E7oM
 M8RpDsoU7Gg4KZxowxHz/caPdlpjQlYpRqvqapPYzlwRQVLYrptbFkGP46vjh0TGLaR9SA0jfOo
 zWkpIfQ0y/+WjMMrtYsd+qVrpzZlhw4HA3sCKU2GzS6wrCJez76Z0qWA/9+6GjaF2I60NpELIlK
 g+PcXcebJUYJ9XvrArE+WY+TBT4CwRKYunObR1JIxTD6ODyPfsNIjYJRDSxPBMg4DlNNamUXTXJ
 NxI8q0fcPui4xt+ZpWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX6+3H+WMT9ezB
 VR08pvOaFJ7sqlji0903RN28nZiQCQtkp1cBSaUl5hdWvovB1TZkBr/NtMdyoHxnGZyOOTp8tDp
 /yx/QRZeMSdambS9H84tniO/EEZtkm0=
X-Proofpoint-GUID: 25d1kS0NcqjBTmBmFJe-hncF0S6oG6JM
X-Proofpoint-ORIG-GUID: 25d1kS0NcqjBTmBmFJe-hncF0S6oG6JM
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4ba58f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fLzRGSmVK1lo7flavS8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130
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
	TAGGED_FROM(0.00)[bounces-39521-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fwnode.dev:url];
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
X-Rspamd-Queue-Id: EA8837115EC

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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..e6e2d6926fef2db82eb1f2bf439e80aacf48668a 100644
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
+	if (dev_fwnode(dev) != &swnode->fwnode && !swnode->fwnode.dev)
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
+	if (dev_fwnode(dev) != &swnode->fwnode && swnode->fwnode.dev == dev)
+		swnode->fwnode.dev = NULL;
+
 	swnode_put(swnode);
 
 	if (swnode->managed) {

-- 
2.47.3


