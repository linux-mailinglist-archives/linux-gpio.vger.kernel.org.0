Return-Path: <linux-gpio+bounces-32458-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBv6Ejb3p2mtmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32458-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:11:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA31FD518
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAB62310EA5C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 09:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBD6397686;
	Wed,  4 Mar 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdZMEtFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeAgRd9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40C396B7F
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615026; cv=none; b=ehn2+Dq9XJZ7PSLPEGX/+o3AncNyDPhKhocqJmG8oqDtiQz3epD0az4i5yTAQogXV5iupgfNK8DSN6oVgTQqkAqU8qtuSNnBN5+g7PRK7g6+fxXZJPx2XKkt2+jUeiGtbJho8ZPj2HtDYdQak5ip/8CZySy8/ZwlvHIqPkpn4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615026; c=relaxed/simple;
	bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfBSK0T7W187PPPy/hApVRTBoO7wJJB8DLBeQrgHR1wRGx523z1BkzOHcDk30c0QXOlpe3dct0DzjCE0OwI63Fm7TW64d7EF/JwRSbMJpxIy9Kg5y7jy+3HQsmE8pqCJSEKEaOAkbHqbDoyeSlv43uxQ+MDX/rqQtUi5uVfR+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdZMEtFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeAgRd9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Srq2153117
	for <linux-gpio@vger.kernel.org>; Wed, 4 Mar 2026 09:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=QdZMEtFgACYOjWMI
	zjzVX6lMjeoh+r78CfuICfgv9KDzAQZTu6KfE+KrrT1ykTKi7e4CYCdfTNGINBoM
	QSExrDbqbBxmj3tBQiPFvxeuzRRQSDl+poZtc2GiB5rhgljz5+G24pLOrvcwewxU
	pYsqrxoXUJFClpuhe2E8leDDjPsdFRzIZJSgAfp9Ghgra0RJdTjdn9Jsnder13bR
	HbQ1qDprRZGko0coyeip/5xZo65evvgkr2rEJRBwt0V1xVKnMomV3AVasglwv1r7
	GtRyf+P4zvLDaw/qGQ04UOc/WK0I/6QmoIDXKz8etkL7/Xm9J9qSM5rH4oRpuXmh
	DZdOXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvjy07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 09:03:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso4198090285a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 01:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615023; x=1773219823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=EeAgRd9VP5ryOgNVc2szVQmnRbzXvxCxq9zxBa7YXqqCZJ+gqBp8h9bq4xb+qpdWIe
         6hBH7Hxy5rsY42yfN8/DKWJNDuQ0/gD5S3WEL4TNOSyFYmwQoYRpZqvL92rUEYM61D+L
         q4cQn7e1F+kIll7CcEToWoj0QPKJYVmxuVbXF9vOlGXY/MMSFWcjvSmeQMLFK7EO7Rjf
         QHOnT1JWMYy3CJfW+Zgm2TKFWyV0VOwVHJYOxFw8px93W8+TTBfdly7xysUqNMaYY/76
         LCwI8jVC+Euj5D4n9rbvFyOo1lzLcrYwMw/LZeQcsial0xFOpc8StQgCwcQNG5s51vAm
         m0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615023; x=1773219823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=lRuDtZrIDNGaWgI8mtcTpQb6vOdUSMM1T9CDHJwK39iJdVScMnOta4C0Z1sPLv7lzS
         lCVNvzwH4fJMLYlCwHlvZy+HUoOiUv/hB+rBU3otZZv2QdjZ+DDBuODRRZ79l3/IpVsZ
         vj7BTDjJYcXNM8TQ1TGdzrXaWcaowgSaxcP9ESt2Aoedoikl/+0FbCHfFmpcbTXGgM8U
         l6IA35w/FbPrV4RnICIS03hR/1d2aDMqj/0iI5dA1ckjkdgu2UUm35Zy4KfshUV+Fu8c
         zM8l5Z0XU8ItHrkDYt6neImDX7xBdoXccwNF+TsKF7elRbq0DPtjFIq9+vRxlc2glz8L
         u0NA==
X-Forwarded-Encrypted: i=1; AJvYcCVOb+/8cjCLaUwv/rtpgE8/1X9Cq9ZHFfKtBVqAESeAuCxtIt/T0kLv0MFy6MM5JE+WAKclI0zbndQy@vger.kernel.org
X-Gm-Message-State: AOJu0YyGj1O7kDHRnBRHbOTuNPgL0x40iSIG49YV9+mrxy5+JsE6d2Wq
	NSMtlijibQV+i8tdeqNDoM7mYJsU/FThKNlg0jUvlVOBKDTXrJFaIaD06JYOvBGsBV7NsnPEiDG
	OJxmge4vg2TtGRYfrxknJSCvFUI5v0g1V1JLUrX8D2YqeBkHLXnn65Pg/q1/dh2R7
X-Gm-Gg: ATEYQzzMEHQ9QxGZWrMxujsMhUV+XHMzR0XcriGfB0NXgGGi4PLCFa60JWMQvTBCEVV
	7zEU8sShpxGbp7Z8zH94uof5183ZaByTD6VVr57LSD/LDgH0XMqJmFBgWvq+yPiZ4jkbUciClLf
	f/vUOtKzTn148Onn26y2RZIURgAMaPjC4G/YmCmiy5Vtkp1sz0xs2BbRW1ZPQ5UYoo7nDZcqLLx
	yh+FS02rfdPI/D9EO/HfQ6EQ1BMl5A/AG9HSRfmCIdNqyLXHRjaWmIYcvtSg0SAPOMIaPtS1Nvt
	uH5T4J7xg7+pSlxgv7s2Jr8/l3jybtibuC7ClF6SQIa/+FDodq/vBYocl+Ii2fPsN3zy8maI+Vm
	4NCrJ4xZCskQX1RF7clbW5wG0aobXN7z21mFDmleaB148HOaquNF4
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153996785a.2.1772615023232;
        Wed, 04 Mar 2026 01:03:43 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153993585a.2.1772615022782;
        Wed, 04 Mar 2026 01:03:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:34 +0100
Subject: [PATCH 13/14] power: reset: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-13-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U1CAGsVjzpABaYhlFKngSKy+KmCDgU4eXzu
 q57RqMlO2iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NQAKCRAFnS7L/zaE
 w3DqD/9PZaqFjzHPxlhtWo0GqKJVg102IgVfZj/tA1PX7Uxh4/ynWD06yEWrPqhz1HEI9+x2S13
 yT8h28khnaaDI7C4bitx1j6T6cBtXKG5ufSmOkJr7wT1tYcNZd/3B3la5kezelJHlO4WaYK2N6S
 7tgOp3PI+fHBk6JB3126BC2M2XslfGsNRD5RVx++QUGo2DzuXzmWeTr6TgOh0epi9Tq927CSyVo
 JhBLXzNP1AYZKgvUllA84Q2jiw1dqzcC+GXtZtEkFNtYaMJ+N7dcg+kCtF+lk1u4LhMyL5kosoE
 TIXVNq8/9DX5lElAy6BopXJ1esiI4bGjbih1MVq8q+b8OF3DjymUIjNn4q0Ycouumh/Sd24yOqC
 spOSRP4SpSQtdcEhskbiHKywGf6nSVFFAdQcTy0T9Ptf0tuBZSQqh74Myp3webWzBqORNxSdsMa
 a+XpmTJFYPLXAkrQ5UcoRhH2RJbwlcgxuHWQkuG+L3abK3YeuiNH1Wrv1zw4gUPM6/deV9ktxKG
 ju1I9zXk9Rt4mziW0BQZvu6PB5hSJYPW0c1cnhIkG92TA/65fHEvvVcxqAiYNrb87i+QKO2c7Ke
 jbLnEh8hA0NpgmS98XZAw6b1RSS/T/rS7ehewAVW243xTprAfg7qz8uO5ohQq9Lb+3RaXVhAzkq
 TicUPD4/aipoB2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX7kCpBS52YoKk
 I7j94g64NPveBdtieExXrkaE2+nyBCVEubu5iPL8e1Vzg1N1Tcpv4Z8ASEFii8ThZZmivPJSBBz
 jYeHDl7gRRfv8pqeZfmSCIOR0gyvtTGFgtZg7uCpvJHmrNn0u5neK0bzZVR5dnADqxkH/rSZqFG
 fMgiNK6PZF++69FERbWnX4O9XVIOd8U5NCHyN6n1VpJVKiwtp0nq+ec73KdVsn7I7EMu18ZI3/5
 KvSR2KubnFzDxCoJsT25KuqhunEk2akPcLHMR8monDT6C4jb5jocXKUX9wUrG3d/oTfTgUewe/q
 /c/25qYN8hLegacmh8uYup4Go75MO6U+nJJatz1jpe4svOvCRv4uSuIy5NLOpfln5fco0Mq0dLK
 YCOmnCmhRAi1n6JmZwsOu3IBRkIgxIKbTLrPN3A/8uKz3EpOfPJjnabyZlmUN+jhbZSc6nyo/Gp
 SpsxLQpfVHhkTWdkbjQ==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a7f570 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7e2NC5DNqL8rGcNaDHD4bA9lhUaiKdYP
X-Proofpoint-ORIG-GUID: 7e2NC5DNqL8rGcNaDHD4bA9lhUaiKdYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: B9EA31FD518
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32458-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


