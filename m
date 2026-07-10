Return-Path: <linux-gpio+bounces-39829-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zvbLNzz8UGo29gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39829-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:05:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BF973B969
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="IYl0CLl/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RlMxoBRe;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39829-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39829-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89BBE30855A9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE44678F26;
	Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F32472AE
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691516; cv=none; b=A9sK/tXUBgJ9zv7hmBAkk1IB7nguGn7Cxcp9L9nOS8brQ1ABUbxO+Q+WNVbSrp8fvstyXXo3f6q3G81HGEw6ZbMKT3r+0wDz+MviS3D6Xir5xzHkms8Hp+gbLL4c9GUK+FwzRPs2svK7WxlOnNrgKrPyoBZZ0UIdPEyI1KykKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691516; c=relaxed/simple;
	bh=p8na6W0xPTYfTVnsE7Dd5eOOL46+fWqxiXgdhhhwMHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ymv/O/BnjzSugXFEKfroYMa+Slgf5OJUjSmsXMTQeyGLeWwUWDTgaWgzqhIboiC3W+xc0GttIHvbCyvOG4RRLDVD3bJMO6ikcLlMRez2Lfy3X6kiL7xxE6VUqRE6bN+91hKYBsxiDaQM8dWcVGnAMD5DxoCrhbDeXkkddbed3aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYl0CLl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlMxoBRe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6VI0874209
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GOJMry5Lrk7UCqJP9VX7WgzjsId57wM52BDwYMyHQM=; b=IYl0CLl/uU5b+dI8
	Lovkgm3fAEF4TsSsmneucnzMeAyzWBOf4saM55b/qA59n5b+TfQUPAnbOQTj3BXY
	GjaTYapxfv3i19G1hCWYB6yZG+VUt493aou7sY1N1PLnzlfH6F+F8t7IS1bYqFyK
	UtlNq2ZTUhp378gNYidl/1PfmXU6iUtViKYc+TfwVeWw4PU9XZkk6Z7i6yMBYBgN
	eWng8LRH59RX6DtHpAjQwQ6HRDLPUfKvw20u6N4OLPHnzTA0nP950384BrCbwLn2
	Nzkg5EmueT3quxeBT64n53YlxeXYt5DUjFVcIoKumDfYO/jmCG05PqSvpE4HaBBt
	BsfOmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8wne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so10252141cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691513; x=1784296313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GOJMry5Lrk7UCqJP9VX7WgzjsId57wM52BDwYMyHQM=;
        b=RlMxoBReF3SNMi1H76drkXWVb47y4NZOkQNFL/W2DtX6aomZmZnuOxEytmkn8E/RM0
         +1t8dUkzBOvU1kLUkIcm9+mkxSz3l0sTcSNyCOkupLIBi8VKdlaobKi9b9i7iPhCn1/r
         Z8LfzXHU2ssovpBGmtGox+Cu2Qlwy0m6eV5n3yepTR3B6CYARLvVxIvmfFIEU3EUoOSM
         rk1364XzrNPHjW3rlJqcxYVDaRu6sEs4Bv6sKn8UiHYWUkEkDH476LyswoC+z2ZHPw3t
         pqnFAiD5491kt/CYb01VNRDv1Uemk5M+hu7qBVuYWlP/lKmcPqGFhE0xcUevjR7FWNKc
         BRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691513; x=1784296313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GOJMry5Lrk7UCqJP9VX7WgzjsId57wM52BDwYMyHQM=;
        b=m2/j0DYBmaFOGTD8zu4A59aGEro4LoGASBq7oeTD3sr1CZnvrlur4rGT0RxYihb5BM
         aDeXzh01SDiuEBghuYdoDeiujyngQgXDjVWyin3clld5AVEIlYbsMWe2Nhf+n7jUkahz
         7V1NTqLek9sIU7PUeYv9smQavkjfQNkYWdvSBvjOJNpSKzdfa4DAoCCxpIt1s1iyRFWN
         HjbgwU9/6qtx4Jqydcty4ZZcTt/J4y/sZVwJlFzmsjcOtaxvkh1dZImQeVHjBuH0cOZ7
         XVTkjU1FNzMmZ+DHWsXlad8f8/gdhuISpObbVfgJEdCTQR9qTngrKI4rY1hQEKXgkAGQ
         zFQg==
X-Forwarded-Encrypted: i=1; AHgh+RqPDwlQ725gPBcCm7mHXTbJuQhYFHlRrtpBmuPFXxm/WrfYxX/FcHgeZANpK7NZTGY92N1FIMM2TAvK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9McgG13obqUu3zNQ2YJ2arohMtuMQs1cK6L7qWsUtqF4eH6KZ
	Yw4PkLzUwB/dNyW1IVNobdzKKUqVxv9qepKh1TXtusLY4fUP/VtT2M3YlnvqpcSr12nL85WA1P9
	280nuhId7JYcs7gxQ8exRbYr2biUm+zYuGugcaCdd7C+cetwiYPx/wC5VIDWvIPGL
X-Gm-Gg: AfdE7cmNT/TZ2wZtQkiGctlIU8nV3A1ywc07PuDTH9KiL0qsUCEi8VL3TZ/8UBXMhW5
	AumIEkm3Ip9mamkSOJiOzhUJJp95Ov6G4y5+M87dskvkGBfC0OJnWjQl7UTgycql3j6nvxBowec
	b+cQz0/vfwTvaSpbxCLkWvtFsVFbAqBqRnvZWh38TvWc/1nztC65RxeH57jBIju9eVCHqZ+eREE
	wvmLn1+7cTxu7fQAPzlGVZK8kJ16AGE/t7QQsoz8p6w947Bns6olM8fOeDl/XX6ncC25eABtFt7
	NvjuOMiC29LTbqFPhA3/iXg2+lTLrkYwNxGdpzE5a20LdwmlTQ4J1EGFv3/gwnuEgBDT4WrMriM
	OLzZYicfNCMfGEB1xD/diDKzquYouVldlvrj0Cszx
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:649c with SMTP id d75a77b69052e-51c8b411e7dmr129533471cf.64.1783691513068;
        Fri, 10 Jul 2026 06:51:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:649c with SMTP id d75a77b69052e-51c8b411e7dmr129532901cf.64.1783691512576;
        Fri, 10 Jul 2026 06:51:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:21 +0200
Subject: [PATCH v3 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-2-993f31874e40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5927;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p8na6W0xPTYfTVnsE7Dd5eOOL46+fWqxiXgdhhhwMHA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjrpyCZS0mjk0G0cGCkbItm0SHjyb8xeL7R4
 rb5T7biiRKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD46wAKCRAFnS7L/zaE
 w6ixD/9kkAISCrEhTTLyc3rb9FGcOP9AOwfUlXm4ABpAf3CTU7noD+xkmDj6r+aZdfC9sTh2Tss
 vRMLRtJroMPuqRDma94T3LqCCVCzJ7eHRj9LyK3NhxGllXjSaNCnMW0JsD5KW1pqjRzQxwpXqG4
 5bC/++mv7aWzd+j9TZ1AxSfQpinywvKTtRxT+HqIPgXQNpHAfh2n1AB6uddVf7VJ4Sjn3y5cedJ
 PmvjilckDiqRQ0iE65HCic23vT/hhmg3b4cZ7g5ExaOwwX4fQ7TYQ+JGvnvuiyW0FBihy4gXuya
 FbpUxN5sz1tqfUMk1p8i+4puupIK1Kxr+zORkIARU5HGjP4p3E17gd2h6LODmtflvlVU3idQMzL
 1TBBjwTTaYG3n0dO+fwHiL1EfT9yXWJ1K0oMa46q6hxVYPgZVyb9DzmIEQ0zSv+kWlEqhKJA7GR
 6FfOZDGjoTIjXommDRasgfWy/kRWC0UNMC6PF9FO98wI+2pR577zOGi55zGlvKEHdE8UCnDJ9UT
 DPJQrbGuSiLUClACqLaUNEVuqe91mwXfPWI8SAE8tWrMOX4xAaQO4/4M2nxOpPp/WMfRv0t6RdU
 rnRlheItrq34/50fscAY1Zk7RfEiKQujLTIY6I6Sx3bwju0+s/SH7+DbGpDKLlk21fMjvccoSzg
 vxna1u3RgzFKMRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f8f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fLzRGSmVK1lo7flavS8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Q4dTJR4Mpza2i0wZkPbjntuWLR0DriAY
X-Proofpoint-GUID: Q4dTJR4Mpza2i0wZkPbjntuWLR0DriAY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX3nh3M7cU85/p
 UgkdJCdQF7iIDgUR83enF2c/O5Gx6578BSgMHLsL8Dilf4bmzXes9E9yJ+8laD3s2QCDIGbqs8f
 gu+DbzbufqX/Vw198rFd3IcDgeeSFoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXz2rEmkA+/gAJ
 4hWGmr/jM9jJrrNmFoV0McmL0Y2nvnnMe0/w8UfEcCl6JMC6la2NJ+VCjtegwnQpYyzsZNOPOgf
 MufFN2hsZoFBtXRd8unEtlbpRKXgGN2jbFf4ANkuuSG5gaBZAHFg0RBIOufNHLPlvP0Hf35Rm4w
 cjoX61RKSSsh9hryBBKjFs9qOm9Yov2qL9mxc7xm93HG9SHLt6KcjrmdR37TrE2bwzFOyZXYjjl
 BSKCawEYD/WJ8JyLLHH+E37FSJ9CNQPHw/bOya97Jhc3YlA70XWmds8BZHDCXPTFpLQt/u9gzml
 kSM6Dcf/+sYQ6Ke3ijwFU/LhjvqsU3evAeJ18RddKHC0knBRdIzHA0MOT4uXPdMiqM9Yj9yUx2T
 QwsazFmQBQQPYMTDDC4U0VE3oy495opwf7DoBWsTGyBJ4WfRNmQDD3ZC6HrktoN5plSMnEJkUPV
 N7vs9iJR0AuLMqc/orw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100136
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
	TAGGED_FROM(0.00)[bounces-39829-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fwnode.dev:url];
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
X-Rspamd-Queue-Id: E0BF973B969

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


