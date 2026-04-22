Return-Path: <linux-gpio+bounces-35346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lc5MPKi6GngOAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:29:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF2444B39
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF99300C939
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 10:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575533CAE92;
	Wed, 22 Apr 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MD/5iTWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KV6AUv7q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33633B95E
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853675; cv=none; b=Bn81nbyQsr9SCtnc69j2U8OhJkjftt+8aVfCzkti8YcMlN2ZtP/xmJr11AQcBSZ4WVqHDabD8aDHH7SDse7eOWtfWWCBPtQpJHETfXxuSrsRYEiLgCyRjaSU8fLFXCUOyImUPXYQKmUpP9lPmmuA6+gwgbjNUjcsQ18ik8RVgj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853675; c=relaxed/simple;
	bh=MhRAEEMGbnBHDRGro4rO/FZxLZZP36YJLyHA+aDpqGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aYJ7XRSAOuCUozvOnOMV3q69ZPTIbfA/63qJL+xaa48Fc7ShAI0H/4Tlv7wNhJ4q4WmDVbrc+oE9A2gNVX6iLiM/AEJfdYL8teVqWReEkXetAdZC6lHfHOSkI9L88wmJOgLtgNkRXb3/aixeJKt/IgEQEAEnotduhe1LHLpUL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MD/5iTWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KV6AUv7q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M988rw1442052
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pqOLtoY+MEgSxGVOnMf4tN
	X2pzy3aBBfXouIfbANQQo=; b=MD/5iTWhu8MVZX6eRNC4dTFA7jYAYORkJuFPmJ
	7ulul9gGW0WD4p+DXOd8n6Plj/Y9QyeIF1KNAjd7GJLICXZIzwtbebfcDYD4ha3q
	eE72uKHOcRvlGdgznaSe4tpK5bIgxMSKn38nqSmBkQDlV3qBHX7dIfOPVrMc+Aax
	gXWXlfWQl2uRKF+GVgbOJEbGjOKqZX4PgSRNNvX8CnMe29+H/EeUQPYBMwAix1yw
	H8NmNBg1TSp7DIg4cSfPLADMpZeqvW/TVmujPGv84I7GMiJgiuh/0xQ5zvkkVvuu
	RgrApMAZ8FiAcV+Aa2f6QwhYmh4RwTGla09wVTh75r3NHDlw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftv03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:27:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso44945091cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853668; x=1777458468; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqOLtoY+MEgSxGVOnMf4tNX2pzy3aBBfXouIfbANQQo=;
        b=KV6AUv7qh7TJ3uNcuwpLTnxnhZOXQ/iq2k88cOuMd8s1hY8LbvfXQEtlRhAFQQoXGV
         n39C6mLEcz+8ixKKkkbF1AlFy8Tkz21L7s9FUSacph5yJ99vacXfR/wDqJQfDYCdfzPs
         rkEW1j8qjGj1OvYumuhSirpP5p55XH6QkphKJRV2UksEtibxRo29C6pN3+aQXDRctqMZ
         qNYGpcifklgM5218Xs0DcFDPAV58HQTOgvb8Zixs9YVRq2nQfUafMn+vRYVvPMRSAdfH
         4Yd7g/J3tqgQrGs91W8wj+38yp+jBqMtIbzRvj5kbqhjyN0zjMavSVDmwABWUg2UgmLH
         086g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853668; x=1777458468;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqOLtoY+MEgSxGVOnMf4tNX2pzy3aBBfXouIfbANQQo=;
        b=XDpP2kPXmIe/nPTc0j5wWhBj/xLNElhtxzEEGZJ8vfmbs4byD7PlXaiEi738SaQQXt
         FaUSEpeZOIde9SxCaS90wm/7WOJKAM+qXwdMzXLMU0uijknD8wNrpiO1z5VpJbL7H5No
         osKlN1uhFecZ6wjdoTrexmNv9cLVEhVfef7QWFXWb51iP6n00YF+pUn8sKosnHVl55BC
         rmp08CwSXZqZwGygfOz5KkwsP98DYq4FGtPfBoJN9MgF0RQALjglgRDVDnxWAd55IRUo
         Hc4HgNX7bHxoCXPaIRjtL7Fv8lYttGB8ChnXfnebQR1KvmKSN5ja3LYDPLmaTe3msJbS
         mFxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FLfZQdNC8riJUlMSRVVprIHb6khtYiQeZZpiNeaLXP+5afeP/cDtp6NsVI3aLheZoLJqSktNLdWAi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Z2QYpjsDtGTIKv9De0EnDa3kbLOnZ2VtIUdU8mo87DOoz/Jk
	U9zyI8nfbKULa8nheUVUvVt8RwCRRf8QCBPV6rZl2SnUjYxIqpJccK4Yfq+te4By2uY9gqdkMIj
	NYMYvaIydgxxb+opWMV9eM0kkPwJIn66mPpVSiXc3dFOzSS/Q9y6wBpCZQDJ9GpyQJw65Pi+9
X-Gm-Gg: AeBDievIc5hTXIE1Lqvt0CViXKLtiIuqvJ4npgXSdbm6ZaSPBSjzLYaXYzw3oXziMXa
	S0bJ3YCRq7JihMqM2FgD7jnM5kXEj69ABNivUUuJzfffBOeNz+wnYLgy5zWYBWEyIavlIA00n07
	yMBTeuOkfRC9lQdRSqjDkzEnva3d/6I3Q4a2BnYESQp6A79FUxPaz0ia2KQc/w5e+0g28sX9kkf
	lxXej4HYvrQYQ5NZeRJm962xURsIZVIhXL3jQE+OlwfxwloMsPB/vSOdo2x+j+TT9ZslSfd0JVP
	erjH3M9oZVSZPKIpLuS0EDV5Te5qWO/iyBN/lih0+m38ILN8lV5pjVjybQdKuRpg3wL7n4sPDNK
	8z54CeEybEWmiSV8y3awL+H0/RkDwEqtBKCHohj9MsFGXqtkWvgUdM8fcaJtWqQ==
X-Received: by 2002:a05:622a:550a:b0:50d:a8f5:1c02 with SMTP id d75a77b69052e-50e36c15ee8mr319514721cf.41.1776853666346;
        Wed, 22 Apr 2026 03:27:46 -0700 (PDT)
X-Received: by 2002:a05:622a:550a:b0:50d:a8f5:1c02 with SMTP id d75a77b69052e-50e36c15ee8mr319513581cf.41.1776853664562;
        Wed, 22 Apr 2026 03:27:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7c39:7106:a16f:fd13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm237767875e9.7.2026.04.22.03.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:27:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:27:32 +0200
Subject: [PATCH libgpiod] build: replace autotools with meson & ninja
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJOi6GkC/x3MQQqAIBBA0avErBNMq0VXiRajTjVQGkoRiHdPW
 r7F/xkSRaYEU5Mh0sOJg6/o2gbsjn4jwa4alFSj7JUUJ6Xghbn5cAL1YKRGu6IlqMUVaeX3v81
 wsNkuDg6WUj4cTvg6ZwAAAA==
X-Change-ID: 20260420-meson-build-a35b03acface
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Wierich <erik@riscstar.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=105726;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MhRAEEMGbnBHDRGro4rO/FZxLZZP36YJLyHA+aDpqGY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6KKaUIj5w3yDvDwE4vfHeAP6iF86N4cH5oQd+
 heaL/f0GNqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeiimgAKCRAFnS7L/zaE
 w1gQD/9TSh1/zVUaMr45p/Twhj+ptozZPJ7EHwDJLp2moxv/SOOS3hP+OQExXwq5QA79oH8Q5s3
 f5MU0wdjz8cg4U9ckuFZidaExmmsWoLxblv694UNjHDa0FqkWN0QwaOnMVZ2CinQbmFoDEMnblw
 cfInQCaebSOUsCkrSGComLDq0u4bjkFYl6Usr8lgey9eRkglMe0C1FRS+Usl7b2SFILiEpN5ein
 jObX6Ah0MyYxZaSjdySYPeaO0AMkvl51FQsFPfcKcad3Bzvy/3/SGoHPzRj+9ZE3p/qJv+2oZUu
 YuU9PCvQ8Ze6POswxW3ZNdjLvfxBNOv3hcOdGohUq1xj1yCU0+aEbQDBlU+ezwKPi0DYg3EMvgg
 4I9rLO0nRDO/fSv+6stJ/7FrWw7AsOPYccioUxzECAgjs/5qZ9K3viE8sfnGNfvkd2Y9LKWl2Ei
 NiOzNRxOLwHrGm1iDn7epfAWTBlZffZldM05LpFOui7izVHt8osx7Cgj2YC1dOha652JGyOXOI3
 zHd3r+Gxe90UN3W8U5eT1WV5+gQn4jybuKA9HvN+eo/P+rgtHUjfoCNr1nyqQU7lW6YwKRsEs51
 DUslWBAtuRLktyso7Tqhb7TdXIAIvT2kaqRIbsKsLIJOQWWcYLgTapr8VCI/ziyRiJ7hNs46ntF
 fLK0NlPBXc2rMog==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: JcvglRplUKoh4p53uTBunuOfMd55Vxq7
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8a2a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=jk6p-1SlRD0Um2xNEMMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OSBTYWx0ZWRfX0H6lQnfUw394
 6rV3OnhUWGGU66dupEhnRslUEsCm7B6g1gDlSMDyes1RMyJTi0VTDgiGr8+6cW5h3bUZtBaT+bF
 en49I1Anq1bMZ66bHnBRXdYSk6eVjC42ht1gLE9pXN/rohMKTP28r3r2p4SDeqYyOGq55iFmAT1
 jd2eP61vYAxr1V8lBqXaamNob8ljdd7Dcij3Es2Hx6iNoFhkEWXIAPzFup2jR6UZ3M1egotRsay
 mjLqHk3x1VvcC/fiinjL0snWn7EDcSC0Sc65KERJH0Dwt2XeEe2S8YAtwB7N3+Fk3maGwUWn04W
 iy+LAMR5DRh6fk+M6flYEsNgVp6nJVg+RTO225POM+5716RHTdHLcn+OFLu0MGsJo06ERjcv+Pw
 IJj0TNmwUcUkyY/dyXbAfZt+2cWbUY6INBIEo4Sc4xWlobfbGRCgLYE/m+bb5h+6b6ymnfQSp1C
 0Mr65kJPevo36TVDeqA==
X-Proofpoint-ORIG-GUID: JcvglRplUKoh4p53uTBunuOfMd55Vxq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-35346-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[service.in:url,get_multiple_line_values.rs:url,bgdev.pl:email,generate_pypi_artifacts.sh:url,request_config.rs:url,get_line_info.py:url,linaro.org:email,nvidia.com:email,mod.rs:url,info_event.rs:url,watch_line_info.py:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,autogen.sh:url,line_request.rs:url,watch_line_value.rs:url,tests_line_request.py:url,build.rs:url,libtools-common.la:url,libgpiosim-glib.la:url,meson.build:url,watch_line_rising.rs:url];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com,linaro.org,riscstar.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6AF2444B39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Port the project from autotools to meson. All build options are
preserved with the same semantics.

The goal of this change is to produce the same set of files as the
current autotools approach: libraries with correct SONAME/version,
headers, pkg-config files, GObject introspection data, Python extension
modules, D-Bus interface and configuration files. This is done to enable
a one-liner test command running all available test suites.

The only thing we drop is the `make docs` target as it's rarely used and
docs can be generated easily with sphinx directly. They are also not
required for testing.

The Rust workspace is built via a custom target that invokes cargo and
uses SYSTEM_DEPS_* environment variables to point the libgpiod-sys and
gpiosim-sys crates at the locally built C libraries.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I think this is the third or fourth time we try this, maybe this time
it'll stick. This is a port of the current autotools build system to
meson & ninja. A PoC yocto recipe update[1] can be used for testing.

[1] https://github.com/brgl/meta-openembedded/tree/topic/libgpiod-meson
---
 Makefile.am                                     |  62 ----
 autogen.sh                                      |  17 -
 bindings/Makefile.am                            |  29 --
 bindings/cxx/Makefile.am                        |  47 ---
 bindings/cxx/examples/Makefile.am               |  47 ---
 bindings/cxx/examples/meson.build               |  27 ++
 bindings/cxx/gpiodcxx/Makefile.am               |  20 --
 bindings/cxx/meson.build                        |  73 +++++
 bindings/cxx/tests/Makefile.am                  |  30 --
 bindings/cxx/tests/meson.build                  |  29 ++
 bindings/glib/Makefile.am                       | 133 --------
 bindings/glib/examples/Makefile.am              |  22 --
 bindings/glib/examples/meson.build              |  25 ++
 bindings/glib/gpiod-glib/meson.build            |  18 ++
 bindings/glib/meson.build                       | 111 +++++++
 bindings/glib/tests/Makefile.am                 |  29 --
 bindings/glib/tests/meson.build                 |  27 ++
 bindings/meson.build                            |  18 ++
 bindings/python/Makefile.am                     |  58 ----
 bindings/python/examples/Makefile.am            |  17 -
 bindings/python/gpiod/Makefile.am               |  19 --
 bindings/python/gpiod/ext/Makefile.am           |  11 -
 bindings/python/gpiod/meson.build               |  41 +++
 bindings/python/meson.build                     |  10 +
 bindings/python/tests/Makefile.am               |  18 --
 bindings/python/tests/gpiosim/Makefile.am       |   8 -
 bindings/python/tests/gpiosim/meson.build       |  14 +
 bindings/python/tests/meson.build               |  34 ++
 bindings/python/tests/system/Makefile.am        |   7 -
 bindings/python/tests/system/meson.build        |  12 +
 bindings/rust/Makefile.am                       |   6 -
 bindings/rust/gpiosim-sys/Makefile.am           |   6 -
 bindings/rust/gpiosim-sys/src/Makefile.am       |   5 -
 bindings/rust/libgpiod-sys/Makefile.am          |   6 -
 bindings/rust/libgpiod-sys/src/Makefile.am      |   5 -
 bindings/rust/libgpiod/Makefile.am              |  28 --
 bindings/rust/libgpiod/examples/Makefile.am     |  18 --
 bindings/rust/libgpiod/src/Makefile.am          |  15 -
 bindings/rust/libgpiod/tests/Makefile.am        |  15 -
 bindings/rust/libgpiod/tests/common/Makefile.am |   5 -
 bindings/rust/meson.build                       |  40 +++
 configure.ac                                    | 407 ------------------------
 contrib/Makefile.am                             |   4 -
 dbus/Makefile.am                                |  10 -
 dbus/client/Makefile.am                         |  31 --
 dbus/client/gpiocli-test.bash                   |   2 -
 dbus/client/meson.build                         |  30 ++
 dbus/data/Makefile.am                           |  14 -
 dbus/data/meson.build                           |  24 ++
 dbus/lib/Makefile.am                            |  29 --
 dbus/lib/meson.build                            |  35 ++
 dbus/manager/Makefile.am                        |  21 --
 dbus/manager/meson.build                        |  26 ++
 dbus/meson.build                                |  11 +
 dbus/tests/Makefile.am                          |  25 --
 dbus/tests/meson.build                          |  25 ++
 docs/Makefile.am                                |  65 ----
 examples/Makefile.am                            |  22 --
 examples/meson.build                            |  25 ++
 include/Makefile.am                             |   4 -
 include/meson.build                             |   4 +
 lib/Makefile.am                                 |  28 --
 lib/meson.build                                 |  37 +++
 man/Makefile.am                                 |  70 ----
 man/meson.build                                 |  82 +++++
 meson.build                                     | 155 +++++++++
 meson_options.txt                               |  38 +++
 tests/Makefile.am                               |  31 --
 tests/gpiosim-glib/Makefile.am                  |  13 -
 tests/gpiosim-glib/meson.build                  |  11 +
 tests/gpiosim/Makefile.am                       |  15 -
 tests/gpiosim/meson.build                       |  19 ++
 tests/harness/Makefile.am                       |  12 -
 tests/harness/meson.build                       |   9 +
 tests/meson.build                               |  37 +++
 tests/scripts/Makefile.am                       |   4 -
 tests/scripts/gpiod-bash-test-helper.inc        |   8 +-
 tools/Makefile.am                               |  25 --
 tools/gpio-tools-test.bash                      |   3 -
 tools/meson.build                               |  32 ++
 80 files changed, 1083 insertions(+), 1522 deletions(-)

diff --git a/Makefile.am b/Makefile.am
deleted file mode 100644
index 6cbae6d34df8997af720473fbf0f872658b80ee5..0000000000000000000000000000000000000000
--- a/Makefile.am
+++ /dev/null
@@ -1,62 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-ACLOCAL_AMFLAGS = -I m4
-AUTOMAKE_OPTIONS = foreign
-SUBDIRS = include lib contrib
-
-EXTRA_DIST = \
-	LICENSES/GPL-2.0-or-later.txt \
-	LICENSES/Apache-2.0.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/CC-BY-SA-4.0.txt \
-	LICENSES/CC0-1.0.txt \
-	LICENSES/GPL-2.0-only.txt \
-	LICENSES/Linux-syscall-note.txt \
-	LICENSES/BSD-3-Clause.txt
-
-if WITH_EXAMPLES
-
-SUBDIRS += examples
-
-endif
-
-if WITH_TOOLS
-
-SUBDIRS += tools
-
-endif
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-# Build bindings after core tests. When building tests for bindings, we need
-# libgpiosim to be already present.
-SUBDIRS += bindings
-
-if WITH_DBUS
-
-SUBDIRS += dbus
-
-endif
-
-if WITH_MANPAGES
-
-SUBDIRS += man
-
-endif
-
-if WITH_DOCS
-
-SUBDIRS += docs
-
-docs:
-	$(MAKE) -C docs docs
-
-.PHONY: docs
-
-endif
diff --git a/autogen.sh b/autogen.sh
deleted file mode 100755
index 420b821b78376873b8744bbdf09199c1ebfe6fb1..0000000000000000000000000000000000000000
--- a/autogen.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-# SPDX-FileCopyrightText: 2017 Thierry Reding <treding@nvidia.com>
-
-srcdir=`dirname $0`
-test -z "$srcdir" && srcdir=.
-
-ORIGDIR=`pwd`
-cd "$srcdir"
-
-autoreconf --force --install --verbose || exit 1
-cd $ORIGDIR || exit $?
-
-if test -z "$NOCONFIGURE"; then
-	exec "$srcdir"/configure "$@"
-fi
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
deleted file mode 100644
index a1771876b0d60edd3aedee766ad4e0d547104930..0000000000000000000000000000000000000000
--- a/bindings/Makefile.am
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-SUBDIRS = .
-
-if WITH_BINDINGS_CXX
-
-SUBDIRS += cxx
-
-endif
-
-if WITH_BINDINGS_PYTHON
-
-SUBDIRS += python
-
-endif
-
-if WITH_BINDINGS_RUST
-
-SUBDIRS += rust
-
-endif
-
-if WITH_BINDINGS_GLIB
-
-SUBDIRS += glib
-
-endif
diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
deleted file mode 100644
index e2a89cf4231312bef6a41057486ceb398626311e..0000000000000000000000000000000000000000
--- a/bindings/cxx/Makefile.am
+++ /dev/null
@@ -1,47 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES = \
-	chip.cpp \
-	chip-info.cpp \
-	edge-event-buffer.cpp \
-	edge-event.cpp \
-	exception.cpp \
-	info-event.cpp \
-	internal.cpp \
-	internal.hpp \
-	line.cpp \
-	line-config.cpp \
-	line-info.cpp \
-	line-request.cpp \
-	line-settings.cpp \
-	misc.cpp \
-	request-builder.cpp \
-	request-config.cpp
-
-libgpiodcxx_la_CXXFLAGS = -Wall -Wextra -g -std=gnu++17
-libgpiodcxx_la_CXXFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
-libgpiodcxx_la_CXXFLAGS += $(PROFILING_CFLAGS)
-libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
-libgpiodcxx_la_LDFLAGS += $(PROFILING_LDFLAGS)
-libgpiodcxx_la_LIBADD = $(top_builddir)/lib/libgpiod.la
-
-include_HEADERS = gpiod.hpp
-
-pkgconfigdir = $(libdir)/pkgconfig
-pkgconfig_DATA = libgpiodcxx.pc
-
-SUBDIRS = gpiodcxx .
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-if WITH_EXAMPLES
-
-SUBDIRS += examples
-
-endif
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
deleted file mode 100644
index eca4d64a887e06f7f454f2719cd946cfbfcc3642..0000000000000000000000000000000000000000
--- a/bindings/cxx/examples/Makefile.am
+++ /dev/null
@@ -1,47 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
-AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17
-LDADD = $(top_builddir)/bindings/cxx/libgpiodcxx.la
-
-noinst_PROGRAMS = \
-	async_watch_line_value \
-	find_line_by_name \
-	get_chip_info \
-	get_line_info \
-	get_line_value \
-	get_multiple_line_values \
-	reconfigure_input_to_output \
-	toggle_line_value \
-	toggle_multiple_line_values \
-	watch_line_info \
-	watch_line_rising \
-	watch_line_value \
-	watch_multiple_line_values
-
-async_watch_line_value_SOURCES = async_watch_line_value.cpp
-
-find_line_by_name_SOURCES = find_line_by_name.cpp
-
-get_chip_info_SOURCES = get_chip_info.cpp
-
-get_line_info_SOURCES = get_line_info.cpp
-
-get_line_value_SOURCES = get_line_value.cpp
-
-get_multiple_line_values_SOURCES = get_multiple_line_values.cpp
-
-reconfigure_input_to_output_SOURCES = reconfigure_input_to_output.cpp
-
-toggle_line_value_SOURCES = toggle_line_value.cpp
-
-toggle_multiple_line_values_SOURCES = toggle_multiple_line_values.cpp
-
-watch_line_info_SOURCES = watch_line_info.cpp
-
-watch_line_value_SOURCES = watch_line_value.cpp
-
-watch_line_rising_SOURCES = watch_line_rising.cpp
-
-watch_multiple_line_values_SOURCES = watch_multiple_line_values.cpp
diff --git a/bindings/cxx/examples/meson.build b/bindings/cxx/examples/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..b31e52b437b2378fd5ea7c8e8ea4f9d6e74bed38
--- /dev/null
+++ b/bindings/cxx/examples/meson.build
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+cxx_examples = [
+  'async_watch_line_value',
+  'find_line_by_name',
+  'get_chip_info',
+  'get_line_info',
+  'get_line_value',
+  'get_multiple_line_values',
+  'reconfigure_input_to_output',
+  'toggle_line_value',
+  'toggle_multiple_line_values',
+  'watch_line_info',
+  'watch_line_rising',
+  'watch_line_value',
+  'watch_multiple_line_values',
+]
+
+foreach ex : cxx_examples
+  # Use unique target names (not installed, name doesn't matter)
+  executable('cxx_' + ex,
+    sources: [ex + '.cpp'],
+    include_directories: cxx_inc,
+    dependencies: [libgpiodcxx_dep],
+  )
+endforeach
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
deleted file mode 100644
index e3a3b9b38e613c60d4994e5d97151ff576aff54a..0000000000000000000000000000000000000000
--- a/bindings/cxx/gpiodcxx/Makefile.am
+++ /dev/null
@@ -1,20 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
-
-otherincludedir = $(includedir)/gpiodcxx
-otherinclude_HEADERS = \
-	chip.hpp \
-	chip-info.hpp \
-	edge-event-buffer.hpp \
-	edge-event.hpp \
-	exception.hpp \
-	info-event.hpp \
-	line.hpp \
-	line-config.hpp \
-	line-info.hpp \
-	line-request.hpp \
-	line-settings.hpp \
-	misc.hpp \
-	request-builder.hpp \
-	request-config.hpp \
-	timestamp.hpp
diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..467b0d18658cbf04bfc76cb167e5e18dd4a3a147
--- /dev/null
+++ b/bindings/cxx/meson.build
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+cxx_inc = include_directories('.', '../../include')
+
+libgpiodcxx_both = both_libraries('gpiodcxx',
+  sources: [
+    'chip.cpp',
+    'chip-info.cpp',
+    'edge-event-buffer.cpp',
+    'edge-event.cpp',
+    'exception.cpp',
+    'info-event.cpp',
+    'internal.cpp',
+    'line.cpp',
+    'line-config.cpp',
+    'line-info.cpp',
+    'line-request.cpp',
+    'line-settings.cpp',
+    'misc.cpp',
+    'request-builder.cpp',
+    'request-config.cpp',
+  ],
+  include_directories: cxx_inc,
+  cpp_args: ['-fvisibility=hidden'],
+  dependencies: [libgpiod_dep],
+  version: libgpiodcxx_version,
+  soversion: libgpiodcxx_soversion,
+  install: true,
+)
+libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
+
+install_headers('gpiod.hpp')
+
+install_headers(
+  'gpiodcxx/chip.hpp',
+  'gpiodcxx/chip-info.hpp',
+  'gpiodcxx/edge-event-buffer.hpp',
+  'gpiodcxx/edge-event.hpp',
+  'gpiodcxx/exception.hpp',
+  'gpiodcxx/info-event.hpp',
+  'gpiodcxx/line.hpp',
+  'gpiodcxx/line-config.hpp',
+  'gpiodcxx/line-info.hpp',
+  'gpiodcxx/line-request.hpp',
+  'gpiodcxx/line-settings.hpp',
+  'gpiodcxx/misc.hpp',
+  'gpiodcxx/request-builder.hpp',
+  'gpiodcxx/request-config.hpp',
+  'gpiodcxx/timestamp.hpp',
+  subdir: 'gpiodcxx',
+)
+
+pkgconfig.generate(libgpiodcxx_lib,
+  name: 'libgpiodcxx',
+  description: 'C++ bindings for libgpiod',
+  url: 'https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/',
+  version: meson.project_version(),
+  requires: ['libgpiod'],
+)
+
+libgpiodcxx_dep = declare_dependency(
+  link_with: libgpiodcxx_lib,
+  include_directories: cxx_inc,
+)
+
+if opt_examples.allowed()
+  subdir('examples')
+endif
+
+if opt_tests.allowed()
+  subdir('tests')
+endif
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
deleted file mode 100644
index d9284da1b915e84ce7b8512ffa1da453192094bf..0000000000000000000000000000000000000000
--- a/bindings/cxx/tests/Makefile.am
+++ /dev/null
@@ -1,30 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
-AM_CXXFLAGS += -I$(top_srcdir)/tests/gpiosim/
-AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
-AM_LDFLAGS = -pthread $(CATCH2_LIBS)
-LDADD = $(top_builddir)/bindings/cxx/libgpiodcxx.la
-LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-
-noinst_PROGRAMS = gpiod-cxx-test
-
-gpiod_cxx_test_SOURCES = \
-	check-kernel.cpp \
-	gpiod-cxx-test-main.cpp \
-	gpiosim.cpp \
-	gpiosim.hpp \
-	helpers.cpp \
-	helpers.hpp \
-	tests-chip.cpp \
-	tests-chip-info.cpp \
-	tests-edge-event.cpp \
-	tests-info-event.cpp \
-	tests-line.cpp \
-	tests-line-config.cpp \
-	tests-line-info.cpp \
-	tests-line-request.cpp \
-	tests-line-settings.cpp \
-	tests-misc.cpp \
-	tests-request-config.cpp
diff --git a/bindings/cxx/tests/meson.build b/bindings/cxx/tests/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..acd6257c075b317fa746a504a249b4c3ae3bc0b8
--- /dev/null
+++ b/bindings/cxx/tests/meson.build
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+executable('gpiod-cxx-test',
+  sources: [
+    'check-kernel.cpp',
+    'gpiod-cxx-test-main.cpp',
+    'gpiosim.cpp',
+    'helpers.cpp',
+    'tests-chip.cpp',
+    'tests-chip-info.cpp',
+    'tests-edge-event.cpp',
+    'tests-info-event.cpp',
+    'tests-line.cpp',
+    'tests-line-config.cpp',
+    'tests-line-info.cpp',
+    'tests-line-request.cpp',
+    'tests-line-settings.cpp',
+    'tests-misc.cpp',
+    'tests-request-config.cpp',
+  ],
+  include_directories: [
+    cxx_inc,
+    include_directories('../../..'),
+    include_directories('../../../tests/gpiosim'),
+  ],
+  dependencies: [libgpiodcxx_dep, catch2_test_dep, threads_dep],
+  link_with: [libgpiosim_lib],
+)
diff --git a/bindings/glib/Makefile.am b/bindings/glib/Makefile.am
deleted file mode 100644
index f0241e8d947bd9aac83147618ce6d1e09908fddf..0000000000000000000000000000000000000000
--- a/bindings/glib/Makefile.am
+++ /dev/null
@@ -1,133 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-SUBDIRS = .
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-if WITH_EXAMPLES
-
-SUBDIRS += examples
-
-endif
-
-lib_LTLIBRARIES = libgpiod-glib.la
-
-libgpiod_glib_la_SOURCES = \
-	chip.c \
-	chip-info.c \
-	edge-event.c \
-	error.c \
-	info-event.c \
-	internal.c \
-	internal.h \
-	line-config.c \
-	line-info.c \
-	line-request.c \
-	line-settings.c \
-	misc.c \
-	request-config.c
-
-otherincludedir = $(includedir)/gpiod-glib
-otherinclude_HEADERS = \
-	gpiod-glib/chip.h \
-	gpiod-glib/chip-info.h \
-	gpiod-glib/edge-event.h \
-	gpiod-glib/error.h \
-	gpiod-glib/generated-enums.h \
-	gpiod-glib/info-event.h \
-	gpiod-glib/line.h \
-	gpiod-glib/line-config.h \
-	gpiod-glib/line-info.h \
-	gpiod-glib/line-request.h \
-	gpiod-glib/line-settings.h \
-	gpiod-glib/misc.h \
-	gpiod-glib/request-config.h
-
-EXTRA_DIST = \
-	generated-enums.c.template \
-	generated-enums.h.template
-
-project_headers = \
-	$(srcdir)/gpiod-glib/line.h \
-	$(srcdir)/gpiod-glib/edge-event.h \
-	$(srcdir)/gpiod-glib/info-event.h
-
-generated-enums.c: $(project_headers) generated-enums.c.template
-	$(AM_V_GEN)$(GLIB_MKENUMS) \
-		--template=$(srcdir)/generated-enums.c.template \
-		--output=$(builddir)/$@ \
-		$(project_headers)
-
-gpiod-glib/generated-enums.h: $(project_headers) generated-enums.h.template
-	$(AM_V_GEN)$(GLIB_MKENUMS) \
-		--template=$(srcdir)/generated-enums.h.template \
-		--output=$(srcdir)/$@ \
-		$(project_headers)
-
-nodist_libgpiod_glib_la_SOURCES = \
-	generated-enums.c \
-	gpiod-glib/generated-enums.h
-
-BUILT_SOURCES = $(nodist_libgpiod_glib_la_SOURCES)
-CLEANFILES = $(nodist_libgpiod_glib_la_SOURCES)
-
-libgpiod_glib_la_CFLAGS = -Wall -Wextra -g
-libgpiod_glib_la_CFLAGS += -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
-libgpiod_glib_la_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS) $(GIO_UNIX_CFLAGS)
-libgpiod_glib_la_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-glib\"
-libgpiod_glib_la_CFLAGS += $(PROFILING_CFLAGS)
-libgpiod_glib_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GLIB_VERSION))
-libgpiod_glib_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
-libgpiod_glib_la_LDFLAGS += $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS)
-libgpiod_glib_la_LDFLAGS += $(PROFILING_LDFLAGS)
-
-include_HEADERS = gpiod-glib.h
-
-pkgconfigdir = $(libdir)/pkgconfig
-pkgconfig_DATA = gpiod-glib.pc
-
-if HAVE_INTROSPECTION
-
-INTROSPECTION_GIRS = Gpiodglib-1.0.gir
-
-girdir = $(INTROSPECTION_GIRDIR)
-gir_DATA = Gpiodglib-1.0.gir
-
-typelibsdir = $(INTROSPECTION_TYPELIBDIR)
-typelibs_DATA = Gpiodglib-1.0.typelib
-
-Gpiodglib_1_0_gir_SCANNERFLAGS = \
-	--c-include="gpiod-glib.h" \
-	--warn-all \
-	--namespace Gpiodglib \
-	--identifier-prefix Gpiodglib \
-	--symbol-prefix gpiodglib
-
-Gpiodglib_1_0_gir_CFLAGS = \
-	$(libgpiod_glib_la_CFLAGS) \
-	-DGPIODGLIB_COMPILATION
-
-Gpiodglib-1.0.gir: libgpiod-glib.la
-Gpiodglib_1_0_gir_INCLUDES = Gio-2.0
-Gpiodglib_1_0_gir_LIBS = libgpiod-glib.la
-Gpiodglib_1_0_gir_FILES = $(otherinclude_HEADERS) $(libgpiod_glib_la_SOURCES)
-Gpiodglib_1_0_gir_EXPORT_PACKAGES = gpiod-glib
-
-include $(INTROSPECTION_MAKEFILE)
-
-endif
-
-if HAS_GI_DOCGEN
-
-doc: Gpiodglib-1.0.gir gi-docgen.toml
-	$(AM_V_GEN)gi-docgen generate --config gi-docgen.toml Gpiodglib-1.0.gir
-.PHONY: doc
-
-EXTRA_DIST += gi-docgen.toml
-
-endif
diff --git a/bindings/glib/examples/Makefile.am b/bindings/glib/examples/Makefile.am
deleted file mode 100644
index 47035bb686ab46da84678194ec1c1c74f24aea3b..0000000000000000000000000000000000000000
--- a/bindings/glib/examples/Makefile.am
+++ /dev/null
@@ -1,22 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-noinst_PROGRAMS = \
-	find_line_by_name_glib \
-	get_chip_info_glib \
-	get_line_info_glib \
-	get_line_value_glib \
-	get_multiple_line_values_glib \
-	reconfigure_input_to_output_glib \
-	toggle_line_value_glib \
-	toggle_multiple_line_values_glib \
-	watch_line_info_glib \
-	watch_line_value_glib \
-	watch_multiple_edge_rising_glib
-
-AM_CFLAGS = -I$(top_srcdir)/bindings/glib/
-AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GOBJECT_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiotools-glib\"
-LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
-LDADD += $(GLIB_LIBS) $(GOBJECT_LIBS)
diff --git a/bindings/glib/examples/meson.build b/bindings/glib/examples/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..5d0976f19eecea2978ca88bbb05669fddcba966b
--- /dev/null
+++ b/bindings/glib/examples/meson.build
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+glib_examples = [
+  'find_line_by_name_glib',
+  'get_chip_info_glib',
+  'get_line_info_glib',
+  'get_line_value_glib',
+  'get_multiple_line_values_glib',
+  'reconfigure_input_to_output_glib',
+  'toggle_line_value_glib',
+  'toggle_multiple_line_values_glib',
+  'watch_line_info_glib',
+  'watch_line_value_glib',
+  'watch_multiple_edge_rising_glib',
+]
+
+foreach ex : glib_examples
+  executable(ex,
+    sources: [ex + '.c'],
+    include_directories: glib_inc,
+    c_args: ['-DG_LOG_DOMAIN="gpiotools-glib"'],
+    dependencies: [libgpiod_glib_dep, glib_dep, gobject_dep],
+  )
+endforeach
diff --git a/bindings/glib/gpiod-glib/meson.build b/bindings/glib/gpiod-glib/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..8439ac7914c107bba619cbe8df98b5c7635ec72d
--- /dev/null
+++ b/bindings/glib/gpiod-glib/meson.build
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+gen_enum_h = custom_target('generated-enums-h',
+  input: [
+    files('line.h', 'edge-event.h', 'info-event.h'),
+    files('../generated-enums.h.template'),
+  ],
+  output:  'generated-enums.h',
+  command: [
+    glib_mkenums,
+    '--template', '@INPUT3@',
+    '--output', '@OUTPUT@',
+    '@INPUT0@', '@INPUT1@', '@INPUT2@',
+  ],
+  install: true,
+  install_dir: get_option('includedir') / 'gpiod-glib',
+)
diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..dd817d9a7fa0e5c274bc837dba2d2a3a942d8e96
--- /dev/null
+++ b/bindings/glib/meson.build
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+subdir('gpiod-glib')
+
+project_headers = files(
+  'gpiod-glib/line.h',
+  'gpiod-glib/edge-event.h',
+  'gpiod-glib/info-event.h',
+)
+
+gen_enum_c = custom_target('generated-enums-c',
+  input: project_headers + [files('generated-enums.c.template')],
+  output: 'generated-enums.c',
+  command: [
+    glib_mkenums,
+    '--template', '@INPUT3@',
+    '--output', '@OUTPUT@',
+    '@INPUT0@', '@INPUT1@', '@INPUT2@',
+  ],
+)
+
+glib_sources = [
+  'chip.c',
+  'chip-info.c',
+  'edge-event.c',
+  'error.c',
+  'info-event.c',
+  'internal.c',
+  'line-config.c',
+  'line-info.c',
+  'line-request.c',
+  'line-settings.c',
+  'misc.c',
+  'request-config.c',
+]
+
+glib_public_headers = files(
+  'gpiod-glib/chip.h',
+  'gpiod-glib/chip-info.h',
+  'gpiod-glib/edge-event.h',
+  'gpiod-glib/error.h',
+  'gpiod-glib/info-event.h',
+  'gpiod-glib/line.h',
+  'gpiod-glib/line-config.h',
+  'gpiod-glib/line-info.h',
+  'gpiod-glib/line-request.h',
+  'gpiod-glib/line-settings.h',
+  'gpiod-glib/misc.h',
+  'gpiod-glib/request-config.h',
+)
+
+glib_inc = include_directories('.', '../../include')
+
+libgpiod_glib_both = both_libraries('gpiod-glib',
+  sources: glib_sources + [gen_enum_c, gen_enum_h],
+  include_directories: glib_inc,
+  c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'],
+  dependencies: [libgpiod_dep, glib_dep, gobject_dep, gio_dep, gio_unix_dep],
+  version: libgpiod_glib_version,
+  soversion: libgpiod_glib_soversion,
+  install: true,
+)
+libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
+
+install_headers('gpiod-glib.h')
+
+install_headers(glib_public_headers, subdir: 'gpiod-glib')
+
+pkgconfig.generate(libgpiod_glib_lib,
+  name: 'gpiod-glib',
+  description: 'GObject bindings for libgpiod',
+  url: 'https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/',
+  version: meson.project_version(),
+  requires_private: ['libgpiod >= 2.1'],
+)
+
+libgpiod_glib_dep = declare_dependency(
+  link_with: libgpiod_glib_lib,
+  include_directories: glib_inc,
+)
+
+if opt_introspection.allowed() and gir_dep.found()
+  gnome = import('gnome')
+
+  glib_gir = gnome.generate_gir(libgpiod_glib_lib,
+    sources: glib_sources + glib_public_headers + [gen_enum_c, gen_enum_h],
+    namespace: 'Gpiodglib',
+    nsversion: '1.0',
+    identifier_prefix: 'Gpiodglib',
+    symbol_prefix: 'gpiodglib',
+    includes: ['Gio-2.0'],
+    header: 'gpiod-glib.h',
+    export_packages: 'gpiod-glib',
+    extra_args: [
+      '--c-include=gpiod-glib.h',
+      '--warn-all',
+      '-DGPIODGLIB_COMPILATION',
+    ],
+    include_directories: glib_inc,
+    install: true,
+  )
+endif
+
+if opt_examples.allowed()
+  subdir('examples')
+endif
+
+if opt_tests.allowed()
+  subdir('tests')
+endif
diff --git a/bindings/glib/tests/Makefile.am b/bindings/glib/tests/Makefile.am
deleted file mode 100644
index a90587acfb274c994b654122342502e287df7a49..0000000000000000000000000000000000000000
--- a/bindings/glib/tests/Makefile.am
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-noinst_PROGRAMS = gpiod-glib-test
-gpiod_glib_test_SOURCES = \
-	helpers.c \
-	helpers.h \
-	tests-chip.c \
-	tests-chip-info.c \
-	tests-edge-event.c \
-	tests-info-event.c \
-	tests-line-config.c \
-	tests-line-info.c \
-	tests-line-request.c \
-	tests-line-settings.c \
-	tests-misc.c \
-	tests-request-config.c
-
-AM_CFLAGS = -I$(top_srcdir)/bindings/glib/
-AM_CFLAGS += -I$(top_srcdir)/tests/gpiosim-glib/
-AM_CFLAGS += -I$(top_srcdir)/tests/harness/
-AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-glib-test\"
-LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
-LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-LDADD += $(top_builddir)/tests/gpiosim-glib/libgpiosim-glib.la
-LDADD += $(top_builddir)/tests/harness/libgpiod-test-harness.la
-LDADD += $(GLIB_LIBS) $(GIO_LIBS)
diff --git a/bindings/glib/tests/meson.build b/bindings/glib/tests/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..1d38dee0f81c30a04539b6abdf1fe9907b10709f
--- /dev/null
+++ b/bindings/glib/tests/meson.build
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+executable('gpiod-glib-test',
+  sources: [
+    'helpers.c',
+    'tests-chip.c',
+    'tests-chip-info.c',
+    'tests-edge-event.c',
+    'tests-info-event.c',
+    'tests-line-config.c',
+    'tests-line-info.c',
+    'tests-line-request.c',
+    'tests-line-settings.c',
+    'tests-misc.c',
+    'tests-request-config.c',
+  ],
+  include_directories: [
+    glib_inc,
+    include_directories('../../..'),
+    include_directories('../../../tests/gpiosim-glib'),
+    include_directories('../../../tests/harness'),
+  ],
+  c_args: ['-DG_LOG_DOMAIN="gpiod-glib-test"'],
+  dependencies: [libgpiod_glib_dep, glib_test_dep, gio_test_dep],
+  link_with: [libgpiosim_lib, libgpiosim_glib_lib, libgpiod_test_harness_lib],
+)
diff --git a/bindings/meson.build b/bindings/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..19700059d9870fc9c7f37c4ce7519536fbf36e9e
--- /dev/null
+++ b/bindings/meson.build
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+if opt_bindings_cxx.allowed()
+  subdir('cxx')
+endif
+
+if opt_bindings_glib.allowed()
+  subdir('glib')
+endif
+
+if opt_bindings_python.allowed()
+  subdir('python')
+endif
+
+if opt_bindings_rust.allowed()
+  subdir('rust')
+endif
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
deleted file mode 100644
index 19ebb32214be6fa4e7186d666e661821c8f8327f..0000000000000000000000000000000000000000
--- a/bindings/python/Makefile.am
+++ /dev/null
@@ -1,58 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	MANIFEST.in \
-	README.md \
-	build_tests.py \
-	generate_pypi_artifacts.sh \
-	pyproject.toml \
-	setup.py
-
-if WITH_TESTS
-
-python-tests:
-	TOP_SRCDIR=$(abs_top_builddir) \
-	TOP_BUILDDIR=$(abs_top_builddir) \
-	$(PYTHON) build_tests.py
-
-python-tests-run:
-	PYTHONPATH=$(abs_top_srcdir)/bindings/python \
-	LD_LIBRARY_PATH=$(abs_top_builddir)/lib/.libs/:\
-	$(abs_top_builddir)/tests/gpiosim/.libs/ \
-	$(PYTHON) -B -m tests
-
-else
-
-python-tests:
-
-endif
-
-clean-local:
-	rm -rf dist
-	rm -rf gpiod.egg-info
-	rm -f gpiod/_ext.*.so
-	rm -f tests/*/_ext.*.so
-
-all-local: python-tests
-	CFLAGS="-I$(abs_top_srcdir)/include/ -I$(abs_top_srcdir)/tests/gpiosim \
-	-L$(abs_top_builddir)/lib/.libs/ -L$(abs_top_builddir)/tests/gpiosim/.libs/" \
-	$(PYTHON) -m build
-
-install-exec-local:
-	$(PYTHON) -m pip install dist/*.whl \
-	--ignore-installed --prefix=$(prefix) --root=$(if $(DESTDIR),$(DESTDIR),/)
-
-SUBDIRS = gpiod
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-if WITH_EXAMPLES
-
-SUBDIRS += examples
-
-endif
diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
deleted file mode 100644
index 88523125e86c5f64fa4bdd0802feb6cd1ef23bc5..0000000000000000000000000000000000000000
--- a/bindings/python/examples/Makefile.am
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	async_watch_line_value.py \
-	find_line_by_name.py \
-	get_chip_info.py \
-	get_line_info.py \
-	get_line_value.py \
-	get_multiple_line_values.py \
-	reconfigure_input_to_output.py \
-	toggle_line_value.py \
-	toggle_multiple_line_values.py \
-	watch_line_info.py \
-	watch_line_value.py \
-	watch_line_rising.py \
-	watch_multiple_line_values.py
diff --git a/bindings/python/gpiod/Makefile.am b/bindings/python/gpiod/Makefile.am
deleted file mode 100644
index 7e37b8dee0010a2dd6c2d55d47de38f6f1e6d4f5..0000000000000000000000000000000000000000
--- a/bindings/python/gpiod/Makefile.am
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-SUBDIRS = ext
-
-EXTRA_DIST = \
-	chip_info.py \
-	chip.py \
-	_ext.pyi \
-	edge_event.py \
-	exception.py \
-	info_event.py \
-	__init__.py \
-	_internal.py \
-	line_info.py \
-	line.py \
-	line_request.py \
-	line_settings.py \
-	version.py
diff --git a/bindings/python/gpiod/ext/Makefile.am b/bindings/python/gpiod/ext/Makefile.am
deleted file mode 100644
index 3a8a0d1fb7f70c2511912bdd8b0d7a375e82d60e..0000000000000000000000000000000000000000
--- a/bindings/python/gpiod/ext/Makefile.am
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	chip.c \
-	common.c \
-	internal.h \
-	line-config.c \
-	line-settings.c \
-	module.c \
-	request.c
diff --git a/bindings/python/gpiod/meson.build b/bindings/python/gpiod/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..93d21a0e3f313ba0a432d118352627a0eb4702cc
--- /dev/null
+++ b/bindings/python/gpiod/meson.build
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+py.extension_module('_ext',
+  sources: [
+    'ext/chip.c',
+    'ext/common.c',
+    'ext/line-config.c',
+    'ext/line-settings.c',
+    'ext/module.c',
+    'ext/request.c',
+  ],
+  include_directories: [libgpiod_inc],
+  dependencies: [libgpiod_dep],
+  c_args: ['-D_GNU_SOURCE=1', '-Wall', '-Wextra'],
+  subdir: 'gpiod',
+  install: true,
+)
+
+py_sources = [
+  '__init__.py',
+  'chip.py',
+  'chip_info.py',
+  'edge_event.py',
+  'exception.py',
+  'info_event.py',
+  '_internal.py',
+  'line_info.py',
+  'line.py',
+  'line_request.py',
+  'line_settings.py',
+  'version.py',
+  '_ext.pyi',
+  'py.typed',
+]
+
+py.install_sources(files(py_sources), subdir: 'gpiod')
+
+foreach f : py_sources
+  configure_file(input: f, output: f, copy: true)
+endforeach
diff --git a/bindings/python/meson.build b/bindings/python/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..efd99a9d8118106005a4a42edcb906d6a5b65818
--- /dev/null
+++ b/bindings/python/meson.build
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+py = import('python').find_installation('python3', required: true)
+
+subdir('gpiod')
+
+if opt_tests.allowed()
+  subdir('tests')
+endif
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
deleted file mode 100644
index 1809206beb5cf90f6f4a0bc93428579925d012eb..0000000000000000000000000000000000000000
--- a/bindings/python/tests/Makefile.am
+++ /dev/null
@@ -1,18 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-SUBDIRS = gpiosim system
-
-EXTRA_DIST = \
-	helpers.py \
-	__init__.py \
-	__main__.py \
-	tests_chip_info.py \
-	tests_chip.py \
-	tests_edge_event.py \
-	tests_info_event.py \
-	tests_line.py \
-	tests_line_info.py \
-	tests_line_request.py \
-	tests_line_settings.py \
-	tests_module.py
diff --git a/bindings/python/tests/gpiosim/Makefile.am b/bindings/python/tests/gpiosim/Makefile.am
deleted file mode 100644
index cc8c11a6bacf18ec54bc947959f84e29b9b3a0f0..0000000000000000000000000000000000000000
--- a/bindings/python/tests/gpiosim/Makefile.am
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	chip.py \
-	_ext.pyi \
-	ext.c \
-	__init__.py
diff --git a/bindings/python/tests/gpiosim/meson.build b/bindings/python/tests/gpiosim/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..8933fc45dcef7e646adbd186248490d35d3df9b6
--- /dev/null
+++ b/bindings/python/tests/gpiosim/meson.build
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+py.extension_module('_ext',
+  sources: ['ext.c'],
+  include_directories: [libgpiosim_inc],
+  link_with: [libgpiosim_lib],
+  c_args: ['-D_GNU_SOURCE=1', '-Wall', '-Wextra'],
+  install: false,
+)
+
+foreach f : ['__init__.py', 'chip.py', '_ext.pyi']
+  configure_file(input: f, output: f, copy: true)
+endforeach
diff --git a/bindings/python/tests/meson.build b/bindings/python/tests/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..aad0c11a6fcf7723d095e2225465c606cbd30ca1
--- /dev/null
+++ b/bindings/python/tests/meson.build
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+subdir('gpiosim')
+subdir('system')
+
+foreach f : [
+  '__init__.py',
+  '__main__.py',
+  'helpers.py',
+  'tests_chip.py',
+  'tests_chip_info.py',
+  'tests_edge_event.py',
+  'tests_info_event.py',
+  'tests_line.py',
+  'tests_line_info.py',
+  'tests_line_request.py',
+  'tests_line_settings.py',
+  'tests_module.py',
+]
+  configure_file(input: f, output: f, copy: true)
+endforeach
+
+test_env = environment()
+test_env.set('PYTHONPATH', meson.global_build_root() / 'bindings' / 'python')
+test_env.append('LD_LIBRARY_PATH', meson.global_build_root() / 'lib')
+test_env.append('LD_LIBRARY_PATH', meson.global_build_root() / 'tests' / 'gpiosim')
+
+test('python-tests',
+  py,
+  args: ['-B', '-m', 'tests'],
+  env: test_env,
+  is_parallel: false,
+)
diff --git a/bindings/python/tests/system/Makefile.am b/bindings/python/tests/system/Makefile.am
deleted file mode 100644
index 3590be3962603ffc13ff18785f1de0c005be67a4..0000000000000000000000000000000000000000
--- a/bindings/python/tests/system/Makefile.am
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	_ext.pyi \
-	ext.c \
-	__init__.py
diff --git a/bindings/python/tests/system/meson.build b/bindings/python/tests/system/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..aec6f7cf784eb1c116eb0351db6858de07fa6004
--- /dev/null
+++ b/bindings/python/tests/system/meson.build
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+py.extension_module('_ext',
+  sources: ['ext.c'],
+  c_args: ['-D_GNU_SOURCE=1', '-Wall', '-Wextra'],
+  install: false,
+)
+
+foreach f : ['__init__.py', '_ext.pyi']
+  configure_file(input: f, output: f, copy: true)
+endforeach
diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
deleted file mode 100644
index e89c39327c898c7798b24fcd7ab38c6cd3e22273..0000000000000000000000000000000000000000
--- a/bindings/rust/Makefile.am
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-
-EXTRA_DIST = Cargo.toml
-SUBDIRS = gpiosim-sys libgpiod libgpiod-sys
diff --git a/bindings/rust/gpiosim-sys/Makefile.am b/bindings/rust/gpiosim-sys/Makefile.am
deleted file mode 100644
index 3107223198356f3a49ef1b41f17cd9f05eecd5fa..0000000000000000000000000000000000000000
--- a/bindings/rust/gpiosim-sys/Makefile.am
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = build.rs Cargo.toml README.md
-SUBDIRS = src
diff --git a/bindings/rust/gpiosim-sys/src/Makefile.am b/bindings/rust/gpiosim-sys/src/Makefile.am
deleted file mode 100644
index e88f477083a0c114b0d3693f99808be6de165b2b..0000000000000000000000000000000000000000
--- a/bindings/rust/gpiosim-sys/src/Makefile.am
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = lib.rs sim.rs
diff --git a/bindings/rust/libgpiod-sys/Makefile.am b/bindings/rust/libgpiod-sys/Makefile.am
deleted file mode 100644
index 667f3de89100a494732b2fd228bab764fc202168..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod-sys/Makefile.am
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = build.rs Cargo.toml README.md wrapper.h
-SUBDIRS = src
diff --git a/bindings/rust/libgpiod-sys/src/Makefile.am b/bindings/rust/libgpiod-sys/src/Makefile.am
deleted file mode 100644
index 0ef728b7ffac9271c37aef1ea8172ba765ce1504..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod-sys/src/Makefile.am
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = lib.rs
diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
deleted file mode 100644
index 619e36caadcc5fefc5d3c3b4dd3ed2a19e0dbcfb..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod/Makefile.am
+++ /dev/null
@@ -1,28 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-# We do not want to build against the system libs when building with make. So we
-# specify the paths to the build directory of the C lib.
-command = SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1 \
-		SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="${PWD}/../../../lib/.libs/" \
-		SYSTEM_DEPS_LIBGPIOD_LIB=gpiod \
-		SYSTEM_DEPS_LIBGPIOD_INCLUDE="${PWD}/../../../include/"  \
-		cargo build --features=vnext --release --lib
-
-if WITH_TESTS
-command += --tests
-endif
-
-if WITH_EXAMPLES
-command += --examples
-endif
-
-all:
-	$(command)
-
-clean:
-	cargo clean
-
-EXTRA_DIST = Cargo.toml
-SUBDIRS = examples src tests
diff --git a/bindings/rust/libgpiod/examples/Makefile.am b/bindings/rust/libgpiod/examples/Makefile.am
deleted file mode 100644
index 48b182c5b677694b42ac1f171f68d35c90b722c8..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod/examples/Makefile.am
+++ /dev/null
@@ -1,18 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = \
-	buffered_event_lifetimes.rs \
-	find_line_by_name.rs \
-	get_chip_info.rs \
-	get_line_info.rs \
-	get_line_value.rs \
-	get_multiple_line_values.rs \
-	reconfigure_input_to_output.rs \
-	toggle_line_value.rs \
-	toggle_multiple_line_values.rs \
-	watch_line_info.rs \
-	watch_line_rising.rs \
-	watch_line_value.rs \
-	watch_multiple_line_values.rs
diff --git a/bindings/rust/libgpiod/src/Makefile.am b/bindings/rust/libgpiod/src/Makefile.am
deleted file mode 100644
index 5892600694645a317eb1966c61563e30e7703822..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod/src/Makefile.am
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = \
-	chip.rs \
-	edge_event.rs \
-	event_buffer.rs \
-	info_event.rs \
-	lib.rs \
-	line_config.rs \
-	line_info.rs \
-	line_request.rs \
-	line_settings.rs \
-	request_config.rs
diff --git a/bindings/rust/libgpiod/tests/Makefile.am b/bindings/rust/libgpiod/tests/Makefile.am
deleted file mode 100644
index 8927649d07e029a042962efef152b5198225a5e4..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod/tests/Makefile.am
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = \
-	chip.rs \
-	edge_event.rs \
-	info_event.rs \
-	line_config.rs \
-	line_info.rs \
-	line_request.rs \
-	line_settings.rs \
-	request_config.rs
-
-SUBDIRS = common
diff --git a/bindings/rust/libgpiod/tests/common/Makefile.am b/bindings/rust/libgpiod/tests/common/Makefile.am
deleted file mode 100644
index 6a32db427eccdff5ae6ff952ba2986568234dcd1..0000000000000000000000000000000000000000
--- a/bindings/rust/libgpiod/tests/common/Makefile.am
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = config.rs mod.rs
diff --git a/bindings/rust/meson.build b/bindings/rust/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..4b38298a0c4dfc880a1e320f892e07a0d0e85b6f
--- /dev/null
+++ b/bindings/rust/meson.build
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+fs = import('fs')
+libgpiod_so_dir = fs.parent(libgpiod_lib.full_path())
+libgpiosim_a_dir = fs.parent(libgpiosim_static.full_path())
+libgpiod_src_inc = meson.project_source_root() / 'include'
+rust_src_dir = meson.current_source_dir()
+rust_build_dir = meson.current_build_dir()
+
+# We do not want to build against the system libs when building with meson. So
+# we specify the paths to the build directory of the C lib.
+cargo_env = environment()
+cargo_env.set('SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG', '1')
+cargo_env.set('SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE', libgpiod_so_dir)
+cargo_env.set('SYSTEM_DEPS_LIBGPIOD_LIB', 'gpiod')
+cargo_env.set('SYSTEM_DEPS_LIBGPIOD_INCLUDE', libgpiod_src_inc)
+# gpiosim-sys links against the static gpiosim archive via a hardcoded
+# relative path in its build.rs, override that with RUSTFLAGS so the
+# build succeeds with an out-of-tree meson build.
+cargo_env.set('RUSTFLAGS', '-L ' + libgpiosim_a_dir)
+
+# We use a stamp file as the custom_target output because cargo manages its
+# own build artifacts inside the target directory.
+rust_stamp = custom_target('rust-bindings',
+  output:  'rust-bindings.stamp',
+  command: [
+    cargo,
+    'build',
+    '--features=vnext',
+    '--release',
+    '--lib',
+    '--manifest-path', rust_src_dir / 'Cargo.toml',
+    '--target-dir', rust_build_dir / 'target',
+    '&&', 'touch', '@OUTPUT@',
+  ],
+  env: cargo_env,
+  depends: [libgpiod_lib, libgpiosim_static],
+  build_by_default: true,
+)
diff --git a/configure.ac b/configure.ac
deleted file mode 100644
index c1bae2af351003bfc4acecb70afbf64b55b3b383..0000000000000000000000000000000000000000
--- a/configure.ac
+++ /dev/null
@@ -1,407 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-AC_PREREQ([2.71])
-
-AC_INIT([libgpiod], [2.3], [], [],
-	[https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/])
-AC_SUBST(EXTRA_VERSION, [-devel])
-
-AC_DEFINE_UNQUOTED([GPIOD_VERSION_STR],
-			["$PACKAGE_VERSION$EXTRA_VERSION"],
-			[Full library version string.])
-AC_SUBST(VERSION_STR, [$PACKAGE_VERSION$EXTRA_VERSION])
-
-# From the libtool manual:
-#
-# (...)
-# 3. If the library source code has changed at all since the last update, then
-#    increment revision ('c:r:a' becomes 'c:r+1:a').
-# 4. If any interfaces have been added, removed, or changed since the last
-#    update, increment current, and set revision to 0.
-# 5. If any interfaces have been added since the last public release, then
-#    increment age.
-# 6. If any interfaces have been removed or changed since the last public
-#    release, then set age to 0.
-#
-# Define the libtool version as (C.R.A):
-# NOTE: this version only applies to the core C library.
-AC_SUBST(ABI_VERSION, [4.1.1])
-# Have a separate ABI version for C++ bindings:
-AC_SUBST(ABI_CXX_VERSION, [3.0.1])
-# ABI version for libgpiosim (we need this since it can be installed if we
-# enable tests).
-AC_SUBST(ABI_GPIOSIM_VERSION, [1.1.0])
-# ... and another one for GLib bindings:
-AC_SUBST(ABI_GLIB_VERSION, [1.0.0])
-
-# Core libgpiod API version.
-AC_SUBST(API_VERSION, [2.2.0])
-AC_DEFINE_UNQUOTED([GPIOD_API_VERSION_STR], ["$API_VERSION"], [Library API version string.])
-
-AC_CONFIG_AUX_DIR([autostuff])
-AC_CONFIG_MACRO_DIRS([m4])
-AM_INIT_AUTOMAKE([foreign subdir-objects])
-
-m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-m4_pattern_forbid([^AX_],
-	[Unexpanded AX_ macro found. Please install GNU autoconf-archive.])
-
-AC_CONFIG_SRCDIR([lib])
-AC_CONFIG_HEADERS([config.h])
-
-AC_DEFINE([_GNU_SOURCE], [], [We want GNU extensions])
-
-# Silence warning: ar: 'u' modifier ignored since 'D' is the default
-AC_SUBST(AR_FLAGS, [cr])
-
-AM_PROG_AR
-AC_PROG_CC
-AC_PROG_CXX
-AC_PROG_INSTALL
-AC_PROG_EGREP
-
-LT_INIT
-PKG_PROG_PKG_CONFIG([0.28])
-
-AC_DEFUN([ERR_NOT_FOUND],
-	[AC_MSG_ERROR([$1 not found (needed to build $2)], [1])])
-
-AC_DEFUN([FUNC_NOT_FOUND_LIB],
-	[ERR_NOT_FOUND([$1()], [the library])])
-
-AC_DEFUN([HEADER_NOT_FOUND_LIB],
-	[ERR_NOT_FOUND([$1 header], [the library])])
-
-# This is always checked (library needs this)
-AC_CHECK_INCLUDES_DEFAULT
-
-AC_FUNC_MALLOC
-AC_HEADER_STDBOOL
-AC_CHECK_FUNC([ioctl], [], [FUNC_NOT_FOUND_LIB([ioctl])])
-AC_CHECK_FUNC([open], [], [FUNC_NOT_FOUND_LIB([open])])
-AC_CHECK_FUNC([close], [], [FUNC_NOT_FOUND_LIB([close])])
-AC_CHECK_FUNC([read], [], [FUNC_NOT_FOUND_LIB([read])])
-AC_CHECK_FUNC([ppoll], [], [FUNC_NOT_FOUND_LIB([ppoll])])
-AC_CHECK_FUNC([realpath], [], [FUNC_NOT_FOUND_LIB([realpath])])
-AC_CHECK_FUNC([readlink], [], [FUNC_NOT_FOUND_LIB([readlink])])
-AC_CHECK_HEADERS([fcntl.h], [], [HEADER_NOT_FOUND_LIB([fcntl.h])])
-AC_CHECK_HEADERS([getopt.h], [], [HEADER_NOT_FOUND_LIB([getopt.h])])
-AC_CHECK_HEADERS([dirent.h], [], [HEADER_NOT_FOUND_LIB([dirent.h])])
-AC_CHECK_HEADERS([poll.h], [], [HEADER_NOT_FOUND_LIB([poll.h])])
-AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])])
-AC_CHECK_HEADERS([sys/ioctl.h], [], [HEADER_NOT_FOUND_LIB([sys/ioctl.h])])
-AC_CHECK_HEADERS([sys/param.h], [], [HEADER_NOT_FOUND_LIB([sys/param.h])])
-AC_CHECK_HEADERS([sys/stat.h], [], [HEADER_NOT_FOUND_LIB([sys/stat.h])])
-AC_CHECK_HEADERS([sys/types.h], [], [HEADER_NOT_FOUND_LIB([sys/types.h])])
-AC_CHECK_HEADERS([linux/const.h], [], [HEADER_NOT_FOUND_LIB([linux/const.h])])
-AC_CHECK_HEADERS([linux/ioctl.h], [], [HEADER_NOT_FOUND_LIB([linux/ioctl.h])])
-AC_CHECK_HEADERS([linux/types.h], [], [HEADER_NOT_FOUND_LIB([linux/types.h])])
-
-AC_ARG_ENABLE([tools],
-	[AS_HELP_STRING([--enable-tools],[enable libgpiod command-line tools [default=no]])],
-	[if test "x$enableval" = xyes; then with_tools=true; fi],
-	[with_tools=false])
-AM_CONDITIONAL([WITH_TOOLS], [test "x$with_tools" = xtrue])
-
-AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
-	[ERR_NOT_FOUND([$1()], [tools])])
-
-AC_ARG_ENABLE([gpioset-interactive],
-	[AS_HELP_STRING([--enable-gpioset-interactive],
-		[enable gpioset interactive mode [default=no]])],
-	[if test "x$enableval" = xyes; then with_gpioset_interactive=true; fi],
-	[with_gpioset_interactive=false])
-AM_CONDITIONAL([WITH_GPIOSET_INTERACTIVE],
-	[test "x$with_gpioset_interactive" = xtrue])
-
-if test "x$with_tools" = xtrue
-then
-	# These are only needed to build tools
-	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
-	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
-	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
-	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionsort])])
-	AC_CHECK_FUNC([strtoull], [], [FUNC_NOT_FOUND_TOOLS([strtoull])])
-	AC_CHECK_FUNC([nanosleep], [], [FUNC_NOT_FOUND_TOOLS([nanosleep])])
-	if test "x$with_gpioset_interactive" = xtrue
-	then
-		PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])
-	fi
-fi
-
-AC_ARG_ENABLE([tests],
-	[AS_HELP_STRING([--enable-tests],[enable libgpiod tests [default=no]])],
-	[if test "x$enableval" = xyes; then with_tests=true; fi],
-	[with_tests=false])
-AM_CONDITIONAL([WITH_TESTS], [test "x$with_tests" = xtrue])
-
-AC_ARG_ENABLE([profiling],
-	[AS_HELP_STRING([--enable-profiling],
-		[enable gcov profiling on the core library and tests [default=no]])],
-	[if test "x$enableval" = xyes; then with_profiling=true; fi],
-	[with_profiling=false])
-if test "x$with_profiling" = xtrue
-then
-	AC_SUBST(PROFILING_CFLAGS, ["-fprofile-arcs -ftest-coverage"])
-	AC_SUBST(PROFILING_LDFLAGS, ["-lgcov"])
-fi
-
-AC_DEFUN([FUNC_NOT_FOUND_TESTS],
-	[ERR_NOT_FOUND([$1()], [tests])])
-
-AC_DEFUN([HEADER_NOT_FOUND_TESTS],
-	[ERR_NOT_FOUND([$1 header], [the test suite])])
-
-if test "x$with_tests" = xtrue
-then
-	# For libgpiosim
-	PKG_CHECK_MODULES([KMOD], [libkmod >= 18])
-	PKG_CHECK_MODULES([MOUNT], [mount >= 2.33.1])
-
-	# For core library tests
-	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.74])
-	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.74])
-
-	AC_CHECK_FUNC([atexit], [], [FUNC_NOT_FOUND_TESTS([atexit])])
-	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TESTS([asprintf])])
-	AC_CHECK_FUNC([prctl], [], [FUNC_NOT_FOUND_TESTS([prctl])])
-	AC_CHECK_FUNC([unlink], [], [FUNC_NOT_FOUND_TESTS([unlink])])
-	AC_CHECK_FUNC([unlinkat], [], [FUNC_NOT_FOUND_TESTS([unlinkat])])
-	AC_CHECK_FUNC([openat], [], [FUNC_NOT_FOUND_TESTS([openat])])
-	AC_CHECK_FUNC([mkdirat], [], [FUNC_NOT_FOUND_TESTS([mkdirat])])
-	AC_CHECK_FUNC([write], [], [FUNC_NOT_FOUND_TESTS([write])])
-	AC_CHECK_FUNC([twalk], [], [FUNC_NOT_FOUND_TESTS([twalk])])
-	AC_CHECK_FUNC([tsearch], [], [FUNC_NOT_FOUND_TESTS([tsearch])])
-	AC_CHECK_FUNC([tdestroy], [], [FUNC_NOT_FOUND_TESTS([tdestroy])])
-	AC_CHECK_FUNC([tdelete], [], [FUNC_NOT_FOUND_TESTS([tdelete])])
-	AC_CHECK_FUNC([setrlimit], [], [FUNC_NOT_FOUND_TESTS([setrlimit])])
-	AC_CHECK_HEADERS([sys/utsname.h], [], [FUNC_NOT_FOUND_TESTS([sys/utsname.h])])
-	AC_CHECK_HEADERS([sys/mount.h], [], [FUNC_NOT_FOUND_TESTS([sys/mount.h])])
-	AC_CHECK_HEADERS([sys/prctl.h], [], [FUNC_NOT_FOUND_TESTS([sys/prctl.h])])
-	AC_CHECK_HEADERS([sys/random.h], [], [FUNC_NOT_FOUND_TESTS([sys/random.h])])
-	AC_CHECK_HEADERS([linux/version.h], [], [FUNC_NOT_FOUND_TESTS([linux/version.h])])
-	AC_CHECK_HEADERS([pthread.h], [], [FUNC_NOT_FOUND_TESTS([pthread.h])])
-	AC_CHECK_LIB(pthread, pthread_mutex_lock, [], ERR_NOT_FOUND([pthread library], [tests]))
-
-	if test "x$with_tools" = xtrue
-	then
-		AC_CHECK_PROG([has_shunit2], [shunit2], [true], [false])
-		if test "x$has_shunit2" = "xfalse"
-		then
-			AC_MSG_NOTICE([shunit2 not found - gpio-tools tests cannot be run])
-		fi
-	fi
-fi
-
-AC_ARG_ENABLE([examples],
-	[AS_HELP_STRING([--enable-examples], [enable building code examples[default=no]])],
-	[if test "x$enableval" = xyes; then with_examples=true; fi],
-	[with_examples=false])
-AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
-
-AC_ARG_ENABLE([bindings-cxx],
-	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
-	[with_bindings_cxx=false])
-AM_CONDITIONAL([WITH_BINDINGS_CXX], [test "x$with_bindings_cxx" = xtrue])
-
-AC_DEFUN([HEADER_NOT_FOUND_CXX],
-	[ERR_NOT_FOUND([$1 header], [C++ bindings])])
-
-if test "x$with_bindings_cxx" = xtrue
-then
-	LT_LANG([C++])
-	# This needs autoconf-archive
-	AX_CXX_COMPILE_STDCXX_17([ext], [mandatory])
-
-	if test "x$with_tests" = xtrue
-	then
-		PKG_CHECK_MODULES([CATCH2], [catch2-with-main >= 3.0],, [
-			AC_LANG_PUSH([C++])
-			AC_CHECK_HEADERS([catch2/catch_all.hpp], [],
-					 [HEADER_NOT_FOUND_CXX([catch2/catch_all.hpp])])
-			AC_LANG_POP([C++])
-		])
-	fi
-fi
-
-AC_ARG_ENABLE([bindings-python],
-	[AS_HELP_STRING([--enable-bindings-python],[enable python3 bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_python=true; fi],
-	[with_bindings_python=false])
-AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
-
-if test "x$with_bindings_python" = xtrue
-then
-	AM_PATH_PYTHON([3.10], [],
-		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
-fi
-
-AC_ARG_ENABLE([bindings-rust],
-	[AS_HELP_STRING([--enable-bindings-rust],[enable rust bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_rust=true; fi],
-	[with_bindings_rust=false])
-AM_CONDITIONAL([WITH_BINDINGS_RUST], [test "x$with_bindings_rust" = xtrue])
-
-if test "x$with_bindings_rust" = xtrue
-then
-	AC_CHECK_PROG([has_cargo], [cargo], [true], [false])
-	if test "x$has_cargo" = xfalse
-	then
-		AC_MSG_ERROR([cargo not found - needed for rust bindings])
-	fi
-fi
-
-AC_ARG_ENABLE([dbus],
-	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
-	[if test "x$enableval" == xyes; then with_dbus=true; fi],
-	[with_dbus=false])
-AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
-
-AC_ARG_ENABLE([bindings-glib],
-	[AS_HELP_STRING([--enable-bindings-glib],[enable GLib 2.0 bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_glib=true; fi],
-	[with_bindings_glib=false])
-
-AC_DEFUN([FUNC_NOT_FOUND_DBUS],
-	[ERR_NOT_FOUND([$1()], [dbus daemon])])
-
-if test "x$with_dbus" = xtrue
-then
-	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_DBUS([daemon])])
-	AC_CHECK_FUNC([strverscmp], [], [FUNC_NOT_FOUND_DBUS([strverscmp])])
-	PKG_CHECK_MODULES([GUDEV], [gudev-1.0 >= 230])
-	AC_CHECK_PROG([has_gdbus_codegen], [gdbus-codegen], [true], [false])
-	if test "x$has_gdbus_codegen" = xfalse
-	then
-		AC_MSG_ERROR([gdbus-codegen not found - needed to build dbus daemon])
-	fi
-
-	# Imply GLib bindings for D-Bus
-	with_bindings_glib=true
-fi
-
-AM_CONDITIONAL([WITH_BINDINGS_GLIB], [test "x$with_bindings_glib" = xtrue])
-
-AC_DEFUN([GLIB_MKENUMS_NOT_FOUND],
-	 [AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings])])
-
-if test "x$with_bindings_glib" = xtrue
-then
-	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.80])
-	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.80])
-	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.80])
-	PKG_CHECK_MODULES([GIO_UNIX], [gio-unix-2.0 >= 2.80])
-	PKG_CHECK_VAR([GLIB_MKENUMS], [glib-2.0], [glib_mkenums], [], GLIB_MKENUMS_NOT_FOUND)
-	AC_CHECK_PROG([has_glib_mkenums], [glib-mkenums], [true], [false])
-	if test "x$has_glib_mkenums" == xfalse
-	then
-		GLIB_MKENUMS_NOT_FOUND
-	fi
-
-	AC_CHECK_PROG([has_gi_docgen], [gi-docgen], [true], [false])
-	if test "x$has_gi_docgen" = xfalse
-	then
-		AC_MSG_NOTICE([gi-docgen not found - GLib documentation cannot be generated])
-	fi
-fi
-AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
-AM_COND_IF([HAS_GI_DOCGEN], [AC_CONFIG_FILES([bindings/glib/gi-docgen.toml])])
-
-# GObject-introspection
-found_introspection=no
-m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
-	[GOBJECT_INTROSPECTION_CHECK([0.6.2])],
-	[AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")])
-
-AC_ARG_ENABLE([systemd],
-	[AS_HELP_STRING([--enable-systemd], [enable systemd support [default=no]])],
-	[if test "x$enableval" == xyes; then with_systemd=true; fi],
-	[with_systemd=false])
-AM_CONDITIONAL([WITH_SYSTEMD], [test "x$with_systemd" = xtrue])
-
-if test "x$with_systemd" = xtrue
-then
-	PKG_CHECK_VAR([systemdsystemunitdir], [systemd], [systemdsystemunitdir], [],
-		      AC_MSG_ERROR([systemdsystemunitdir not found - needed to enable systemd support]))
-	AC_CONFIG_FILES([dbus/data/gpio-manager.service])
-fi
-
-if test "x$cross_compiling" = xno
-then
-	AC_CHECK_PROG([has_help2man], [help2man], [true], [false])
-fi
-AM_CONDITIONAL([WITH_MANPAGES], [test "x$has_help2man" = xtrue])
-if test "x$has_help2man" = xfalse
-then
-	AC_MSG_NOTICE([help2man not found - man pages and documentation cannot be generated])
-fi
-
-AC_DEFUN([DOC_PROG_NOT_FOUND], [AC_MSG_NOTICE([$1 not found - documentation cannot be generated])])
-AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
-AC_CHECK_PROG([has_sphinx], [sphinx-build], [true], [false])
-AC_CHECK_PROG([has_pandoc], [pandoc], [true], [false])
-AM_CONDITIONAL([WITH_DOCS], [test "x$has_doxygen" = xtrue && test "x$has_sphinx" = xtrue && test "x$has_pandoc" = xtrue && test "x$has_help2man" = xtrue])
-if test "x$has_doxygen" = xfalse
-then
-	DOC_PROG_NOT_FOUND(["doxygen"])
-fi
-if test "x$has_sphinx" = xfalse
-then
-	DOC_PROG_NOT_FOUND(["sphinx-build"])
-fi
-if test "x$has_pandoc" = xfalse
-then
-	DOC_PROG_NOT_FOUND(["pandoc"])
-fi
-
-AC_CONFIG_FILES([Makefile
-		 include/Makefile
-		 lib/Makefile
-		 lib/libgpiod.pc
-		 contrib/Makefile
-		 docs/Makefile
-		 examples/Makefile
-		 tools/Makefile
-		 tests/Makefile
-		 tests/gpiosim/Makefile
-		 tests/gpiosim-glib/Makefile
-		 tests/harness/Makefile
-		 tests/scripts/Makefile
-		 bindings/cxx/libgpiodcxx.pc
-		 bindings/Makefile
-		 bindings/cxx/Makefile
-		 bindings/cxx/gpiodcxx/Makefile
-		 bindings/cxx/examples/Makefile
-		 bindings/cxx/tests/Makefile
-		 bindings/glib/gpiod-glib.pc
-		 bindings/glib/Makefile
-		 bindings/glib/examples/Makefile
-		 bindings/glib/tests/Makefile
-		 bindings/python/Makefile
-		 bindings/python/gpiod/Makefile
-		 bindings/python/gpiod/ext/Makefile
-		 bindings/python/examples/Makefile
-		 bindings/python/tests/Makefile
-		 bindings/python/tests/gpiosim/Makefile
-		 bindings/python/tests/system/Makefile
-		 bindings/rust/libgpiod-sys/src/Makefile
-		 bindings/rust/libgpiod-sys/Makefile
-		 bindings/rust/libgpiod/src/Makefile
-		 bindings/rust/libgpiod/tests/common/Makefile
-		 bindings/rust/libgpiod/tests/Makefile
-		 bindings/rust/libgpiod/Makefile
-		 bindings/rust/libgpiod/examples/Makefile
-		 bindings/rust/Makefile
-		 bindings/rust/gpiosim-sys/src/Makefile
-		 bindings/rust/gpiosim-sys/Makefile
-		 dbus/Makefile
-		 dbus/client/Makefile
-		 dbus/data/Makefile
-		 dbus/lib/Makefile
-		 dbus/manager/Makefile
-		 dbus/tests/Makefile
-		 man/Makefile])
-
-AC_OUTPUT
diff --git a/contrib/Makefile.am b/contrib/Makefile.am
deleted file mode 100644
index 1b50e86ba89164f72623bb70bb0c2747185ca7b8..0000000000000000000000000000000000000000
--- a/contrib/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = Android.bp
diff --git a/dbus/Makefile.am b/dbus/Makefile.am
deleted file mode 100644
index 7868a96c2bed9fe92d36224017028209b887d25f..0000000000000000000000000000000000000000
--- a/dbus/Makefile.am
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-SUBDIRS = data lib manager client
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
diff --git a/dbus/client/Makefile.am b/dbus/client/Makefile.am
deleted file mode 100644
index 519e37738167f4c764a567a4c71ca432cd1ee9da..0000000000000000000000000000000000000000
--- a/dbus/client/Makefile.am
+++ /dev/null
@@ -1,31 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-AM_CFLAGS = -include $(top_builddir)/config.h
-AM_CFLAGS += -I$(top_builddir)/dbus/lib/ -I$(top_srcdir)/dbus/lib/
-AM_CFLAGS += -Wall -Wextra -g
-AM_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS) $(GIO_UNIX_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiocli\"
-AM_LDFLAGS = $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS)
-LDADD = $(top_builddir)/dbus/lib/libgpiodbus.la
-
-bin_PROGRAMS = gpiocli
-
-gpiocli_SOURCES = \
-	common.c \
-	common.h \
-	detect.c \
-	find.c \
-	get.c \
-	gpiocli.c \
-	info.c \
-	monitor.c \
-	notify.c \
-	reconfigure.c \
-	release.c \
-	request.c \
-	requests.c \
-	set.c \
-	wait.c
-
-dist_noinst_SCRIPTS = gpiocli-test.bash
diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
index 1d2337d0a13e2cb4868d91249690a70d6b2d25b5..5160f57ee33a0585b847f1dacc530e2be4f1f625 100755
--- a/dbus/client/gpiocli-test.bash
+++ b/dbus/client/gpiocli-test.bash
@@ -7,8 +7,6 @@
 # is already running.
 #
 
-SOURCE_DIR="$(dirname "${BASH_SOURCE[0]}")"
-
 wait_for_sim() {
 	COUNTER=100
 
diff --git a/dbus/client/meson.build b/dbus/client/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..925e7f6a468795176fa9d6d1e1390f068481c920
--- /dev/null
+++ b/dbus/client/meson.build
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+gpiocli_exe = executable('gpiocli',
+  sources: [
+    'common.c',
+    'common.h',
+    'detect.c',
+    'find.c',
+    'get.c',
+    'gpiocli.c',
+    'info.c',
+    'monitor.c',
+    'notify.c',
+    'reconfigure.c',
+    'release.c',
+    'request.c',
+    'requests.c',
+    'set.c',
+    'wait.c',
+  ],
+  c_args: ['-DG_LOG_DOMAIN="gpiocli"'],
+  dependencies: [
+    libgpiodbus_dep,
+    glib_dep,
+    gio_dep,
+    gio_unix_dep,
+  ],
+  install: true,
+)
diff --git a/dbus/data/Makefile.am b/dbus/data/Makefile.am
deleted file mode 100644
index 5c0ad9304b3249e34936a40f970cf50e34946abf..0000000000000000000000000000000000000000
--- a/dbus/data/Makefile.am
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-dbusdir = $(sysconfdir)/dbus-1/system.d/
-dist_dbus_DATA = io.gpiod1.conf
-
-if WITH_SYSTEMD
-
-dist_systemdsystemunit_DATA = gpio-manager.service
-
-udevdir = $(libdir)/udev/rules.d/
-dist_udev_DATA = 90-gpio.rules
-
-endif
diff --git a/dbus/data/meson.build b/dbus/data/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..8af178bb98c12f7d7b25461c445779b1e29dad7e
--- /dev/null
+++ b/dbus/data/meson.build
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+install_data('io.gpiod1.conf',
+  install_dir: get_option('sysconfdir') / 'dbus-1' / 'system.d',
+)
+
+if opt_systemd.allowed() and systemd_dep.found()
+  service_conf = configuration_data()
+  service_conf.set('prefix', get_option('prefix'))
+
+  gpio_manager_service = configure_file(
+    input: 'gpio-manager.service.in',
+    output: 'gpio-manager.service',
+    configuration: service_conf,
+  )
+
+  install_data(gpio_manager_service,
+    install_dir: systemd_unit_dir,
+  )
+  install_data('90-gpio.rules',
+    install_dir: get_option('libdir') / 'udev' / 'rules.d',
+  )
+endif
diff --git a/dbus/lib/Makefile.am b/dbus/lib/Makefile.am
deleted file mode 100644
index bb452d663869167bf1189074c2fb7e92298714f2..0000000000000000000000000000000000000000
--- a/dbus/lib/Makefile.am
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-libgpiodbus_la_CFLAGS = -include $(top_builddir)/config.h -Wall -Wextra -g
-libgpiodbus_la_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS)
-libgpiodbus_la_CFLAGS += -DG_LOG_DOMAIN=\"gpiodbus\"
-libgpiodbus_la_LDFLAGS = -version-info 1
-
-generated-gpiodbus.h generated-gpiodbus.c: io.gpiod1.xml
-	$(AM_V_GEN)gdbus-codegen \
-		--interface-prefix io.gpiod1 \
-		--c-namespace Gpiodbus \
-		--generate-c-code generated-gpiodbus \
-		--c-generate-object-manager \
-		--c-generate-autocleanup=all \
-		--glib-min-required 2.74.0 \
-		$(srcdir)/io.gpiod1.xml
-
-lib_LTLIBRARIES = libgpiodbus.la
-libgpiodbus_la_SOURCES = \
-	generated-gpiodbus.c \
-	generated-gpiodbus.h \
-	gpiodbus.h
-
-BUILT_SOURCES = generated-gpiodbus.c generated-gpiodbus.h
-CLEANFILES = $(BUILT_SOURCES)
-
-dbusdir = $(datadir)/dbus-1/interfaces
-dist_dbus_DATA = io.gpiod1.xml
diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..9acf5e1f1d4cb9c7c30dbfbadf49755c26abb00e
--- /dev/null
+++ b/dbus/lib/meson.build
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+gnome = import('gnome')
+
+generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
+  sources: 'io.gpiod1.xml',
+  interface_prefix: 'io.gpiod1',
+  namespace: 'Gpiodbus',
+  object_manager: true,
+  autocleanup: 'all',
+  extra_args: ['--glib-min-required', '2.74.0'],
+)
+
+dbus_lib_inc = include_directories('.', '../../include')
+
+libgpiodbus_both = both_libraries('gpiodbus',
+  sources: ['gpiodbus.h', generated_dbus],
+  include_directories: dbus_lib_inc,
+  c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
+  dependencies: [glib_dep, gio_dep],
+  soversion: 1,
+  install: true,
+)
+libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
+
+install_data('io.gpiod1.xml',
+  install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
+)
+
+libgpiodbus_dep = declare_dependency(
+  link_with: libgpiodbus_lib,
+  include_directories: dbus_lib_inc,
+  sources: generated_dbus,
+)
diff --git a/dbus/manager/Makefile.am b/dbus/manager/Makefile.am
deleted file mode 100644
index d1cef8e144c2083163f65367fe4a4959d4d2e5a1..0000000000000000000000000000000000000000
--- a/dbus/manager/Makefile.am
+++ /dev/null
@@ -1,21 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-AM_CFLAGS = -I$(top_srcdir)/bindings/glib/ -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g
-AM_CFLAGS += -I$(top_builddir)/dbus/lib/ -I$(top_srcdir)/dbus/lib/
-AM_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS) $(GIO_UNIX_CFLAGS) $(GUDEV_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpio-manager\"
-AM_CFLAGS += $(PROFILING_CFLAGS)
-AM_LDFLAGS = $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GUDEV_LIBS)
-AM_LDFLAGS += $(PROFILING_LDFLAGS)
-LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
-LDADD += $(top_builddir)/dbus/lib/libgpiodbus.la
-
-bin_PROGRAMS = gpio-manager
-gpio_manager_SOURCES = \
-	daemon.c \
-	daemon.h \
-	helpers.c \
-	helpers.h \
-	gpio-manager.c
diff --git a/dbus/manager/meson.build b/dbus/manager/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..1016a87228f1819cc8a626f1fd4c6e040e501356
--- /dev/null
+++ b/dbus/manager/meson.build
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+gpio_manager_exe = executable('gpio-manager',
+  sources: [
+    'daemon.c',
+    'daemon.h',
+    'helpers.c',
+    'helpers.h',
+    'gpio-manager.c',
+  ],
+  include_directories: [
+    libgpiod_inc,
+    include_directories('../../bindings/glib'),
+  ],
+  c_args: ['-DG_LOG_DOMAIN="gpio-manager"'],
+  dependencies: [
+    libgpiod_glib_dep,
+    libgpiodbus_dep,
+    glib_dep,
+    gio_dep,
+    gio_unix_dep,
+    gudev_dep,
+  ],
+  install: true,
+)
diff --git a/dbus/meson.build b/dbus/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..2df5906298c4edd20377d5f90d62189f46d17eb9
--- /dev/null
+++ b/dbus/meson.build
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+subdir('data')
+subdir('lib')
+subdir('manager')
+subdir('client')
+
+if opt_tests.allowed()
+  subdir('tests')
+endif
diff --git a/dbus/tests/Makefile.am b/dbus/tests/Makefile.am
deleted file mode 100644
index ec4e26c8185b71d7315d252e1cd43181fd69fb37..0000000000000000000000000000000000000000
--- a/dbus/tests/Makefile.am
+++ /dev/null
@@ -1,25 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-noinst_PROGRAMS = gpiodbus-test
-gpiodbus_test_SOURCES = \
-	daemon-process.c \
-	daemon-process.h \
-	helpers.c \
-	helpers.h \
-	tests-chip.c \
-	tests-line.c \
-	tests-request.c
-
-AM_CFLAGS = -I$(top_srcdir)/tests/gpiosim-glib/
-AM_CFLAGS += -I$(top_builddir)/dbus/lib/ -I$(top_srcdir)/dbus/lib/
-AM_CFLAGS += -I$(top_srcdir)/tests/harness/
-AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89
-AM_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiodbus-test\"
-LDADD = $(top_builddir)/tests/gpiosim/libgpiosim.la
-LDADD += $(top_builddir)/tests/gpiosim-glib/libgpiosim-glib.la
-LDADD += $(top_builddir)/tests/harness/libgpiod-test-harness.la
-LDADD += $(top_builddir)/dbus/lib/libgpiodbus.la
-LDADD += $(GLIB_LIBS) $(GIO_LIBS)
diff --git a/dbus/tests/meson.build b/dbus/tests/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..4bb930f7f9f08c13ed4020ace482a828f2c29387
--- /dev/null
+++ b/dbus/tests/meson.build
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+executable('gpiodbus-test',
+  sources: [
+    'daemon-process.c',
+    'daemon-process.h',
+    'helpers.c',
+    'helpers.h',
+    'tests-chip.c',
+    'tests-line.c',
+    'tests-request.c',
+  ],
+  include_directories: [
+    include_directories('../../tests/gpiosim-glib'),
+    include_directories('../../tests/harness'),
+  ],
+  c_args: ['-DG_LOG_DOMAIN="gpiodbus-test"'],
+  dependencies: [
+    libgpiodbus_dep,
+    glib_test_dep,
+    gio_test_dep,
+  ],
+  link_with: [libgpiosim_lib, libgpiosim_glib_lib, libgpiod_test_harness_lib],
+)
diff --git a/docs/Makefile.am b/docs/Makefile.am
deleted file mode 100644
index a03fdb9482010bfb845b911b904355b45b56f5f0..0000000000000000000000000000000000000000
--- a/docs/Makefile.am
+++ /dev/null
@@ -1,65 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-DOCS_DEPS = \
-	bindings.rst \
-	building.rst \
-	conf.py \
-	contributing.rst \
-	core_api.rst \
-	core_chip_info.rst \
-	core_chips.rst \
-	core_edge_event.rst \
-	core_line_config.rst \
-	core_line_defs.rst \
-	core_line_info.rst \
-	core_line_request.rst \
-	core_line_settings.rst \
-	core_line_watch.rst \
-	core_misc.rst \
-	core_request_config.rst \
-	cpp_api.rst \
-	cpp_chip_info.rst \
-	cpp_chip.rst \
-	cpp_edge_event_buffer.rst \
-	cpp_edge_event.rst \
-	cpp_exceptions.rst \
-	cpp_info_event.rst \
-	cpp_line_config.rst \
-	cpp_line_info.rst \
-	cpp_line_request.rst \
-	cpp_line.rst \
-	cpp_line_settings.rst \
-	cpp_misc.rst \
-	cpp_request_config.rst \
-	dbus.rst \
-	dbus_api.rst \
-	Doxyfile \
-	index.rst \
-	glib_api.rst \
-	gpio_tools.rst \
-	gpiocli_top.rst \
-	python_api.rst \
-	python_chip_info.rst \
-	python_chip.rst \
-	python_edge_event.rst \
-	python_exceptions.rst \
-	python_info_event.rst \
-	python_line_info.rst \
-	python_line_request.rst \
-	python_line.rst \
-	python_line_settings.rst \
-	python_misc.rst \
-	rust_api.rst \
-	testing.rst
-
-docs: $(DOCS_DEPS)
-	pushd ..; sphinx-build ./docs/ ./docs/sphinx-output; popd
-
-.PHONY: docs
-
-clean-local:
-	rm -rf sphinx-output
-	rm -rf doxygen-output
-
-EXTRA_DIST = $(DOCS_DEPS) requirements.txt
diff --git a/examples/Makefile.am b/examples/Makefile.am
deleted file mode 100644
index ed01dbc73a104d998493e7845079725ca0117e52..0000000000000000000000000000000000000000
--- a/examples/Makefile.am
+++ /dev/null
@@ -1,22 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
-
-AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89
-
-LDADD = $(top_builddir)/lib/libgpiod.la
-
-noinst_PROGRAMS = \
-	async_watch_line_value \
-	find_line_by_name \
-	get_chip_info \
-	get_line_info \
-	get_line_value \
-	get_multiple_line_values \
-	reconfigure_input_to_output \
-	toggle_line_value \
-	toggle_multiple_line_values \
-	watch_line_info \
-	watch_line_rising \
-	watch_line_value \
-	watch_multiple_line_values
diff --git a/examples/meson.build b/examples/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..257a439aada49a560936197b5c1d69fba7cffa9f
--- /dev/null
+++ b/examples/meson.build
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+c_examples = [
+  'async_watch_line_value',
+  'find_line_by_name',
+  'get_chip_info',
+  'get_line_info',
+  'get_line_value',
+  'get_multiple_line_values',
+  'reconfigure_input_to_output',
+  'toggle_line_value',
+  'toggle_multiple_line_values',
+  'watch_line_info',
+  'watch_line_rising',
+  'watch_line_value',
+  'watch_multiple_line_values',
+]
+
+foreach ex : c_examples
+  executable(ex,
+    sources: [ex + '.c'],
+    dependencies: [libgpiod_dep],
+  )
+endforeach
diff --git a/include/Makefile.am b/include/Makefile.am
deleted file mode 100644
index 7f986ec61169ba60284f33fe5eb2325d05459d22..0000000000000000000000000000000000000000
--- a/include/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-include_HEADERS = gpiod.h
diff --git a/include/meson.build b/include/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..c390581244b9479abd32ca0d080d48a5223fea5d
--- /dev/null
+++ b/include/meson.build
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+install_headers('gpiod.h')
diff --git a/lib/Makefile.am b/lib/Makefile.am
deleted file mode 100644
index 8915e783283a1f7e12471b3af3adc8cf971e060b..0000000000000000000000000000000000000000
--- a/lib/Makefile.am
+++ /dev/null
@@ -1,28 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = \
-	chip.c \
-	chip-info.c \
-	edge-event.c \
-	info-event.c \
-	internal.h \
-	internal.c \
-	line-config.c \
-	line-info.c \
-	line-request.c \
-	line-settings.c \
-	misc.c \
-	request-config.c \
-	uapi/gpio.h
-
-libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
-libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
-libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
-libgpiod_la_CFLAGS += $(PROFILING_CFLAGS)
-libgpiod_la_LDFLAGS = -version-info $(subst .,:,$(ABI_VERSION))
-libgpiod_la_LDFLAGS += $(PROFILING_LDFLAGS)
-
-pkgconfigdir = $(libdir)/pkgconfig
-pkgconfig_DATA = libgpiod.pc
diff --git a/lib/meson.build b/lib/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..c13be2be2c757813e6204feddcc773ce3bffed0c
--- /dev/null
+++ b/lib/meson.build
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+libgpiod_both = both_libraries('gpiod',
+  sources: [
+    'chip.c',
+    'chip-info.c',
+    'edge-event.c',
+    'info-event.c',
+    'internal.c',
+    'line-config.c',
+    'line-info.c',
+    'line-request.c',
+    'line-settings.c',
+    'misc.c',
+    'request-config.c',
+  ],
+  include_directories: [libgpiod_inc, include_directories('.')],
+  c_args: ['-fvisibility=hidden'],
+  version: libgpiod_version,
+  soversion: libgpiod_soversion,
+  install: true,
+)
+libgpiod_lib = libgpiod_both.get_shared_lib()
+
+pkgconfig = import('pkgconfig')
+pkgconfig.generate(libgpiod_lib,
+  name: 'libgpiod',
+  description: 'Library and tools for the Linux GPIO chardev',
+  url: 'https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/',
+  version: meson.project_version(),
+)
+
+libgpiod_dep = declare_dependency(
+  link_with: libgpiod_lib,
+  include_directories: libgpiod_inc,
+)
diff --git a/man/Makefile.am b/man/Makefile.am
deleted file mode 100644
index 8d8bc468d86976895a3fb53ac48c91e65a5ecdd0..0000000000000000000000000000000000000000
--- a/man/Makefile.am
+++ /dev/null
@@ -1,70 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-# SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-MAN_ENTRIES =
-MAN_DEPS =
-
-if WITH_TOOLS
-
-TOOLS = \
-	gpiodetect \
-	gpioinfo \
-	gpioget \
-	gpioset \
-	gpiomon \
-	gpionotify
-
-MAN_ENTRIES += $(TOOLS)
-MAN_DEPS += $(foreach dep,$(TOOLS),$(top_builddir)/tools/$(dep))
-
-endif
-
-if WITH_DBUS
-
-GPIOCLI_CMDS = \
-	detect \
-	find \
-	info \
-	get \
-	monitor \
-	notify \
-	reconfigure \
-	release \
-	request \
-	requests \
-	set \
-	wait
-
-MAN_ENTRIES += \
-	gpio-manager \
-	gpiocli \
-	$(foreach cmd,$(GPIOCLI_CMDS),gpiocli-$(cmd))
-
-MAN_DEPS += \
-	$(top_builddir)/dbus/manager/gpio-manager
-	$(top_builddir)/dbus/client/gpiocli
-
-endif
-
-dist_man1_MANS := $(foreach entry,$(MAN_ENTRIES),$(entry).man)
-
-%.man: $(MAN_DEPS)
-	$(AM_V_GEN)export PATH=$(top_builddir)/dbus/manager/:$(top_builddir)/dbus/client/:$(top_builddir)/tools/:$$PATH; \
-	if [ "$(*F)" = "gpio-manager" ]; then \
-		EXEC=$(*F); \
-		NAME="libgpiod D-Bus daemon"; \
-		HELP=--help-option=--help; \
-	else \
-		EXEC=$(if $(findstring -,$(*F)),$(word 1,$(subst -, ,$(*F))),$(*F)); \
-		NAME=$(if $(findstring -,$(*F)),$(word 2,$(subst -, ,$(*F))),"libgpiod command-line utility"); \
-		HELP=$(if $(findstring -,$(*F)),--help-option="$(word 2,$(subst -, ,$(*F))) --help",--help-option=--help); \
-	fi; \
-	help2man $$EXEC \
-		--include=$(srcdir)/template --output=$(builddir)/$@ --no-info \
-		--name="$$NAME" "$$HELP" --manual=$(*F)
-
-clean-local:
-	rm -f $(dist_man1_MANS)
-
-EXTRA_DIST = template
diff --git a/man/meson.build b/man/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..27b99ac98afc873554cabd5a01a4a50439286298
--- /dev/null
+++ b/man/meson.build
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+man_template = files('template')
+man1_dir = get_option('mandir') / 'man1'
+
+if opt_tools.allowed()
+  foreach tool : ['gpiodetect', 'gpioinfo', 'gpioget', 'gpioset', 'gpiomon', 'gpionotify']
+    custom_target(tool + '.1',
+      output: tool + '.1',
+      command: [
+        help2man,
+        tools_exes[tool],
+        '--include', man_template,
+        '--no-info',
+        '--name=libgpiod command-line utility',
+        '--help-option=--help',
+        '--manual=' + tool,
+        '--output=@OUTPUT@',
+      ],
+      install: true,
+      install_dir: man1_dir,
+    )
+  endforeach
+endif
+
+if opt_dbus.allowed()
+  gpiocli_cmds = [
+    'detect', 'find', 'info', 'get', 'monitor', 'notify',
+    'reconfigure', 'release', 'request', 'requests', 'set', 'wait',
+  ]
+
+  custom_target('gpio-manager.1',
+    output: 'gpio-manager.1',
+    command: [
+      help2man,
+      gpio_manager_exe,
+      '--include', man_template,
+      '--no-info',
+      '--name=libgpiod D-Bus daemon',
+      '--help-option=--help',
+      '--manual=gpio-manager',
+      '--output=@OUTPUT@',
+    ],
+    install: true,
+    install_dir: man1_dir,
+  )
+
+  custom_target('gpiocli.1',
+    output: 'gpiocli.1',
+    command: [
+      help2man,
+      gpiocli_exe,
+      '--include', man_template,
+      '--no-info',
+      '--name=libgpiod command-line utility',
+      '--help-option=--help',
+      '--manual=gpiocli',
+      '--output=@OUTPUT@',
+    ],
+    install: true,
+    install_dir: man1_dir,
+  )
+
+  foreach cmd : gpiocli_cmds
+    custom_target('gpiocli-' + cmd + '.1',
+      output: 'gpiocli-' + cmd + '.1',
+      command: [
+        help2man,
+        gpiocli_exe,
+        '--include', man_template,
+        '--no-info',
+        '--name=' + cmd,
+        '--help-option=' + cmd + ' --help',
+        '--manual=gpiocli-' + cmd,
+        '--output=@OUTPUT@',
+      ],
+      install: true,
+      install_dir: man1_dir,
+    )
+  endforeach
+endif
diff --git a/meson.build b/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..10df7969d0f6e8f157e9f1b39bd8cc90b2092d47
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+project('libgpiod', ['c', 'cpp'],
+  version: '2.3',
+  license: 'LGPL-2.1-or-later',
+  default_options: [
+    'c_std=gnu89',
+    'cpp_std=gnu++17',
+    'warning_level=2',
+  ],
+  meson_version: '>= 0.63.0',
+)
+
+extra_version = '-devel'
+version_str = meson.project_version() + extra_version
+
+# Core libgpiod API version.
+api_version = '2.2.0'
+
+# Core C library ABI version.
+libgpiod_soversion      = '3'
+libgpiod_version        = '3.1.1'
+# Have a separate ABI version for C++ bindings:
+libgpiodcxx_soversion   = '2'
+libgpiodcxx_version     = '2.1.0'
+# ABI version for libgpiosim (we need this since it can be installed if we
+# enable tests).
+libgpiosim_soversion    = '1'
+libgpiosim_version      = '1.0.1'
+# ... and another one for GLib bindings:
+libgpiod_glib_soversion = '1'
+libgpiod_glib_version   = '1.0.0'
+
+add_project_arguments(
+  '-D_GNU_SOURCE',
+  '-DGPIOD_VERSION_STR="@0@"'.format(version_str),
+  '-DGPIOD_API_VERSION_STR="@0@"'.format(api_version),
+  language: ['c', 'cpp'],
+)
+
+opt_tools               = get_option('tools')
+opt_gpioset_interactive = get_option('gpioset-interactive')
+opt_tests               = get_option('tests')
+opt_examples            = get_option('examples')
+opt_bindings_cxx        = get_option('bindings-cxx')
+opt_bindings_python     = get_option('bindings-python')
+opt_bindings_rust       = get_option('bindings-rust')
+opt_bindings_glib       = get_option('bindings-glib')
+opt_dbus                = get_option('dbus')
+opt_introspection       = get_option('introspection')
+opt_systemd             = get_option('systemd')
+
+# D-Bus implies glib bindings.
+if opt_dbus.enabled() and not opt_bindings_glib.enabled()
+  opt_bindings_glib = opt_dbus
+endif
+
+# Introspection requires glib bindings.
+if opt_introspection.enabled()
+  assert(opt_bindings_glib.allowed(),
+    'introspection requires -Dbindings-glib=enabled')
+endif
+
+# systemd requires D-Bus.
+if opt_systemd.enabled()
+  assert(opt_dbus.allowed(),
+    'systemd support requires -Ddbus=enabled')
+endif
+
+libgpiod_inc = include_directories('include')
+
+libedit_dep = dependency('libedit', version: '>= 3.1', required: opt_gpioset_interactive)
+
+if opt_tests.allowed()
+  libkmod_dep   = dependency('libkmod', version: '>= 18', required: opt_tests)
+  mount_dep     = dependency('mount', version: '>= 2.33.1', required: opt_tests)
+  threads_dep   = dependency('threads', required: opt_tests)
+  # glib/gio are also used by tests (different min-version from bindings).
+  glib_test_dep = dependency('glib-2.0', version: '>= 2.74', required: opt_tests)
+  gio_test_dep  = dependency('gio-2.0', version: '>= 2.74', required: opt_tests)
+endif
+
+if opt_bindings_cxx.allowed() and opt_tests.allowed()
+  catch2_test_dep = dependency('catch2-with-main', version: '>= 3.0', required: false)
+  if not catch2_test_dep.found()
+    cxx = meson.get_compiler('cpp')
+    if cxx.has_header('catch2/catch_all.hpp')
+      catch2_test_dep = declare_dependency()
+    endif
+  endif
+endif
+
+if opt_bindings_glib.allowed()
+  glib_dep      = dependency('glib-2.0', version: '>= 2.80', required: opt_bindings_glib)
+  gobject_dep   = dependency('gobject-2.0', version: '>= 2.80', required: opt_bindings_glib)
+  gio_dep       = dependency('gio-2.0', version: '>= 2.80', required: opt_bindings_glib)
+  gio_unix_dep  = dependency('gio-unix-2.0', version: '>= 2.80', required: opt_bindings_glib)
+  glib_mkenums  = find_program('glib-mkenums', required: opt_bindings_glib)
+endif
+
+if opt_dbus.allowed()
+  gudev_dep      = dependency('gudev-1.0', version: '>= 230', required: opt_dbus)
+  gdbus_codegen  = find_program('gdbus-codegen', required: opt_dbus)
+endif
+
+if opt_introspection.allowed()
+  gir_dep       = dependency('gobject-introspection-1.0', version: '>= 0.6.2',
+                             required: opt_introspection)
+  g_ir_scanner  = find_program('g-ir-scanner', required: opt_introspection)
+  g_ir_compiler = find_program('g-ir-compiler', required: opt_introspection)
+endif
+
+if opt_systemd.allowed()
+  systemd_dep = dependency('systemd', required: opt_systemd)
+  if systemd_dep.found()
+    opt_systemd_unit_dir = get_option('systemd-unit-dir')
+    if opt_systemd_unit_dir != ''
+      systemd_unit_dir = opt_systemd_unit_dir
+    else
+      systemd_unit_dir = systemd_dep.get_variable('systemdsystemunitdir')
+    endif
+  endif
+endif
+
+if opt_bindings_rust.allowed()
+  cargo = find_program('cargo', required: opt_bindings_rust)
+endif
+
+help2man = find_program('help2man', required: false)
+
+subdir('include')
+subdir('lib')
+
+if opt_tools.allowed()
+  subdir('tools')
+endif
+
+if opt_examples.allowed()
+  subdir('examples')
+endif
+
+if opt_tests.allowed()
+  subdir('tests')
+endif
+
+subdir('bindings')
+
+if opt_dbus.allowed()
+  subdir('dbus')
+endif
+
+if help2man.found()
+  subdir('man')
+endif
diff --git a/meson_options.txt b/meson_options.txt
new file mode 100644
index 0000000000000000000000000000000000000000..9b9a5ed6b28347b213cf78df23bbeb2214e8c248
--- /dev/null
+++ b/meson_options.txt
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+option('tools', type: 'feature', value: 'disabled',
+  description: 'Build libgpiod command-line tools')
+
+option('gpioset-interactive', type: 'feature', value: 'disabled',
+  description: 'Enable gpioset interactive mode (requires libedit >= 3.1)')
+
+option('tests', type: 'feature', value: 'disabled',
+  description: 'Build the test suite')
+
+option('examples', type: 'feature', value: 'disabled',
+  description: 'Build code examples')
+
+option('bindings-cxx', type: 'feature', value: 'disabled',
+  description: 'Build C++ bindings')
+
+option('bindings-python', type: 'feature', value: 'disabled',
+  description: 'Build Python 3 bindings (requires Python >= 3.10)')
+
+option('bindings-rust', type: 'feature', value: 'disabled',
+  description: 'Build Rust bindings (requires cargo)')
+
+option('bindings-glib', type: 'feature', value: 'disabled',
+  description: 'Build GLib 2.0 / GObject bindings')
+
+option('dbus', type: 'feature', value: 'disabled',
+  description: 'Build the D-Bus daemon and client (implies bindings-glib)')
+
+option('introspection', type: 'feature', value: 'disabled',
+  description: 'Generate GObject introspection data (requires bindings-glib)')
+
+option('systemd', type: 'feature', value: 'disabled',
+  description: 'Install systemd unit and udev rules (requires dbus)')
+
+option('systemd-unit-dir', type: 'string', value: '',
+  description: 'Directory for systemd system unit files (default: from pkg-config)')
diff --git a/tests/Makefile.am b/tests/Makefile.am
deleted file mode 100644
index 7049d21b7c06bc195212cb0f0208c4c1a5d69fe9..0000000000000000000000000000000000000000
--- a/tests/Makefile.am
+++ /dev/null
@@ -1,31 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-SUBDIRS = gpiosim gpiosim-glib harness scripts
-
-AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim-glib/
-AM_CFLAGS += -I$(top_srcdir)/tests/harness/
-AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
-LDADD = $(top_builddir)/lib/libgpiod.la
-LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-LDADD += $(top_builddir)/tests/gpiosim-glib/libgpiosim-glib.la
-LDADD += $(top_builddir)/tests/harness/libgpiod-test-harness.la
-LDADD += $(GLIB_LIBS) $(GIO_LIBS)
-
-noinst_PROGRAMS = gpiod-test
-
-gpiod_test_SOURCES = \
-	helpers.h \
-	tests-chip.c \
-	tests-chip-info.c \
-	tests-edge-event.c \
-	tests-info-event.c \
-	tests-kernel-uapi.c \
-	tests-line-config.c \
-	tests-line-info.c \
-	tests-line-request.c \
-	tests-line-settings.c \
-	tests-misc.c \
-	tests-request-config.c
diff --git a/tests/gpiosim-glib/Makefile.am b/tests/gpiosim-glib/Makefile.am
deleted file mode 100644
index 1c016296a1c31df0a26a5d8049098b0366608ed0..0000000000000000000000000000000000000000
--- a/tests/gpiosim-glib/Makefile.am
+++ /dev/null
@@ -1,13 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-noinst_LTLIBRARIES = libgpiosim-glib.la
-libgpiosim_glib_la_SOURCES = \
-	gpiosim-glib.c \
-	gpiosim-glib.h
-
-AM_CFLAGS = -I$(top_srcdir)/tests/gpiosim/
-AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiosim-glib\"
-libgpiosim_glib_la_LDFLAGS = -lgpiosim
diff --git a/tests/gpiosim-glib/meson.build b/tests/gpiosim-glib/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..1efa8f5873f22824426f5d432f326c3c3d843145
--- /dev/null
+++ b/tests/gpiosim-glib/meson.build
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+libgpiosim_glib_lib = static_library('gpiosim-glib',
+  sources: ['gpiosim-glib.c'],
+  include_directories: [include_directories('../gpiosim')],
+  c_args: ['-DG_LOG_DOMAIN="gpiosim-glib"'],
+  dependencies: [glib_test_dep, gio_test_dep],
+  link_with: [libgpiosim_lib],
+  pic: true,
+)
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
deleted file mode 100644
index 58888737bbe4dbc1743ca6684ce11fe9dc98a271..0000000000000000000000000000000000000000
--- a/tests/gpiosim/Makefile.am
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-lib_LTLIBRARIES = libgpiosim.la
-noinst_PROGRAMS = gpiosim-selftest
-
-AM_CFLAGS = -Wall -Wextra -g -fvisibility=hidden -std=gnu89
-AM_CFLAGS += -include $(top_builddir)/config.h
-
-libgpiosim_la_SOURCES = gpiosim.c gpiosim.h
-libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(MOUNT_CFLAGS)
-libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
-libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS) -pthread
-
-gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tests/gpiosim/meson.build b/tests/gpiosim/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..078a2418496352f3b4bb1bd0286f3e05d589f959
--- /dev/null
+++ b/tests/gpiosim/meson.build
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+libgpiosim_both = both_libraries('gpiosim',
+  sources: ['gpiosim.c'],
+  c_args: ['-fvisibility=hidden'],
+  dependencies: [libkmod_dep, mount_dep, threads_dep],
+  version: libgpiosim_version,
+  soversion: libgpiosim_soversion,
+  install: true,
+)
+libgpiosim_lib = libgpiosim_both.get_shared_lib()
+libgpiosim_static = libgpiosim_both.get_static_lib()
+libgpiosim_inc = include_directories('.')
+
+executable('gpiosim-selftest',
+  sources: ['gpiosim-selftest.c'],
+  link_with: [libgpiosim_lib],
+)
diff --git a/tests/harness/Makefile.am b/tests/harness/Makefile.am
deleted file mode 100644
index 185c00f1bb40b0756753515e053ae5754d8bc5d6..0000000000000000000000000000000000000000
--- a/tests/harness/Makefile.am
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-noinst_LTLIBRARIES = libgpiod-test-harness.la
-libgpiod_test_harness_la_SOURCES = \
-	gpiod-test.c \
-	gpiod-test.h \
-	gpiod-test-common.h
-
-AM_CFLAGS = -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
diff --git a/tests/harness/meson.build b/tests/harness/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..881e9781455d20f997f180477a2b49cd3189ffd4
--- /dev/null
+++ b/tests/harness/meson.build
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+libgpiod_test_harness_lib = static_library('gpiod-test-harness',
+  sources: ['gpiod-test.c'],
+  c_args: ['-DG_LOG_DOMAIN="gpiod-test"'],
+  dependencies: [glib_test_dep],
+  pic: true,
+)
diff --git a/tests/meson.build b/tests/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..0b99205dfaa1a161a45a028af1fb4e089d509f66
--- /dev/null
+++ b/tests/meson.build
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+subdir('gpiosim')
+subdir('gpiosim-glib')
+subdir('harness')
+
+executable('gpiod-test',
+  sources: [
+    'helpers.h',
+    'tests-chip.c',
+    'tests-chip-info.c',
+    'tests-edge-event.c',
+    'tests-info-event.c',
+    'tests-kernel-uapi.c',
+    'tests-line-config.c',
+    'tests-line-info.c',
+    'tests-line-request.c',
+    'tests-line-settings.c',
+    'tests-misc.c',
+    'tests-request-config.c',
+  ],
+  include_directories: [
+    libgpiod_inc,
+    include_directories('gpiosim'),
+    include_directories('gpiosim-glib'),
+    include_directories('harness'),
+  ],
+  c_args: ['-DG_LOG_DOMAIN="gpiod-test"'],
+  dependencies: [
+    libgpiod_dep,
+    glib_test_dep,
+    gio_test_dep,
+    threads_dep,
+  ],
+  link_with: [libgpiosim_lib, libgpiosim_glib_lib, libgpiod_test_harness_lib],
+)
diff --git a/tests/scripts/Makefile.am b/tests/scripts/Makefile.am
deleted file mode 100644
index 5766593a1a6f46e3e30861e690f20d268c6b57a3..0000000000000000000000000000000000000000
--- a/tests/scripts/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-EXTRA_DIST = gpiod-bash-test-helper.inc
diff --git a/tests/scripts/gpiod-bash-test-helper.inc b/tests/scripts/gpiod-bash-test-helper.inc
index d0f8a6d12d9dd4c2d6ed0a02f957679b5d997c8c..d3c5a75a5d46da38250e39a11af18d09ffaca123 100644
--- a/tests/scripts/gpiod-bash-test-helper.inc
+++ b/tests/scripts/gpiod-bash-test-helper.inc
@@ -176,14 +176,14 @@ run_prog() {
 	# testing script.
 	cmd=$1
 	shift
-	output=$(timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1)
+	output=$(timeout 10s "$cmd" "$@" 2>&1)
 	status=$?
 }
 
 dut_run() {
 	cmd=$1
 	shift
-	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1
+	coproc timeout 10s "$cmd" "$@" 2>&1
 	DUT_PID=$COPROC_PID
 	read -r -t1 -n1 -u "${COPROC[0]}" DUT_FIRST_CHAR
 }
@@ -191,7 +191,7 @@ dut_run() {
 dut_run_redirect() {
 	cmd=$1
 	shift
-	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" > "$SHUNIT_TMPDIR/$DUT_OUTPUT" 2>&1
+	coproc timeout 10s "$cmd" "$@" > "$SHUNIT_TMPDIR/$DUT_OUTPUT" 2>&1
 	DUT_PID=$COPROC_PID
 	# give the process time to spin up
 	# FIXME - find a better solution
@@ -278,7 +278,7 @@ tearDown() {
 }
 
 request_release_line() {
-	"$SOURCE_DIR/gpioget" -c "$@" >/dev/null
+	"gpioget" -c "$@" >/dev/null
 }
 
 die() {
diff --git a/tools/Makefile.am b/tools/Makefile.am
deleted file mode 100644
index bf6170a11f9538bcb09bdce2389d73133dbb3d28..0000000000000000000000000000000000000000
--- a/tools/Makefile.am
+++ /dev/null
@@ -1,25 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89
-
-noinst_LTLIBRARIES = libtools-common.la
-libtools_common_la_SOURCES = tools-common.c tools-common.h
-
-LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
-
-if WITH_GPIOSET_INTERACTIVE
-
-AM_CFLAGS += -DGPIOSET_INTERACTIVE $(LIBEDIT_CFLAGS)
-LDADD += $(LIBEDIT_LIBS)
-
-endif
-
-bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpionotify
-
-if WITH_TESTS
-
-dist_noinst_SCRIPTS = gpio-tools-test.bash
-
-endif
diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 0bc6e7db590921a4afee6cb417ac64da2b77d9e2..3ec76dfac95ee276c78dac0c2f9792d8439f5418 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -4,9 +4,6 @@
 # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
-export SOURCE_DIR
-SOURCE_DIR="$(dirname "${BASH_SOURCE[0]}")"
-
 #
 # gpiodetect test cases
 #
diff --git a/tools/meson.build b/tools/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..b26718ba69679d03d210562768f71ea02bc3ed01
--- /dev/null
+++ b/tools/meson.build
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+tools_common_lib = static_library('tools-common',
+  sources: ['tools-common.c'],
+  include_directories: libgpiod_inc,
+  pic: true,
+)
+
+tools_common_dep = declare_dependency(
+  link_with: tools_common_lib,
+  include_directories: include_directories('.'),
+)
+
+tools_c_args = []
+tools_deps = [libgpiod_dep, tools_common_dep]
+
+if opt_gpioset_interactive.allowed() and libedit_dep.found()
+  tools_c_args += ['-DGPIOSET_INTERACTIVE']
+  tools_deps += [libedit_dep]
+endif
+
+tools_exes = {}
+foreach tool : ['gpiodetect', 'gpioinfo', 'gpioget', 'gpioset', 'gpiomon', 'gpionotify']
+  tools_exes += {tool: executable(tool,
+    sources: [tool + '.c'],
+    include_directories: libgpiod_inc,
+    dependencies: tools_deps,
+    c_args: tools_c_args,
+    install: true,
+  )}
+endforeach

---
base-commit: aff7a6143bea49e26208986aaa21bc4081146942
change-id: 20260420-meson-build-a35b03acface

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


