Return-Path: <linux-gpio+bounces-34465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JdtES6Ry2kuIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:17:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E30366DD6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CEFE30351B8
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0172E3EC2FD;
	Tue, 31 Mar 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbDdF1gr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsaJypay"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C3DA7F7
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948262; cv=none; b=F5GKJt0pkkIamh0OSvHXsAkSawCTfP2gahM0giboeI9hc1rrhm1Cf1UWVTxHHuXSDf9sQil8K7inkPHnEoCamzLSdrSJ0mwuVqgceCbgF0P4DVbxZpB2SlrENWCYPXlTA8lYjdRrODFNcfEHZt/ZTcxSCKvXfsUFJZcffUEl88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948262; c=relaxed/simple;
	bh=gNfw92MKGJloH5lQFl0qvVBeXgsIWu0g+hx/PhbV3os=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qkc2VNPQ4v9vAXkv7cgfT+NqaeAvv/jcz7Keg2DWPASQdE57vmtuSNZQJJxFf+W5yH5RILoB1zd76aDc4/hpd/48TkI+OOLgg5uFzTh035SSyF9NxOtRxX/9NxrwqDuVydhpOodPm5W2tdADFvD3o3ZCURhbhQ3eF3kebhvlBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbDdF1gr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsaJypay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5SHxO2408168
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rofAEuGQOrjqZkvSyqr9+
	MlK3x1jL7wHrb7Kr4V9Zw=; b=pbDdF1gry4hOg4JaP1lbQ7EwZkpKidSW2FUWBA
	3Dio2DPOZcPssorEdOU4UGSfWYRZ2uZJd/MOazD1oFk3iMUemvYtGMX7qJixDKi/
	TadnLhm7ypLjbNJCVF79O2ob7WzPPzzzoMhglXfajnKO2vdl+P0qu+gw09A4MdXR
	9IrR6gODms8ZfHY1r6nKEwGMLG2q+sTF580N++LueZHnrMzc4kfxa1jA+mbZ/sTR
	qn/Qr94v88N+3Bq7CrH2RJjX7w2KBQ/3StKMLG/UaW7vGMvZVDhKgP6vnmjSnz0A
	Vh4eIL1vY8FBw3f/cIQMMQWzUmXrgc5qk+cDNgPjthiFTVKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hetb07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:10:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso77437221cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948259; x=1775553059; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rofAEuGQOrjqZkvSyqr9+MlK3x1jL7wHrb7Kr4V9Zw=;
        b=OsaJypaySqDTpU9LcsfveyOy2WqfRDlEMvEuefiWDgnbsB4fhQ3tqIdXKnJrJrDnAb
         /WhAagaWhjkAPDLRftAenYfcE02W7QG/EQf/O3ZPolN4uEKVTdsmI6VzsIiCg2w9moYp
         c3I/8+2+0BzHAw8qFP3rGS5WucP6QGuhEGqAcPMO29n5HuZwvBQc97QNg0l1WFQEeCaQ
         XC70F7DB3chQ4utA5A6BVjyuYy6h+YJWpLu8egNF1skOSu/UykjsL7xVYo6T/1M4KgWy
         EZcdkKMPWRK7Z/I1GNwVSiu/LC0kwKzqMR+58DKlhHDdqckPaxUitidojZVGL1FSkGHH
         cwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948259; x=1775553059;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rofAEuGQOrjqZkvSyqr9+MlK3x1jL7wHrb7Kr4V9Zw=;
        b=I27ETOjIgGjILgOK7J90alNg5k9gkj8DaysFHKqxXIDMFMydDKE+qqDlU38ZVxZfTT
         nT7Pl++MifCG4yRWvQWWgLbCPKOzVb/UGNbNoQwxkXjepDJJVvLGpFsVTxBVfkLf8i0W
         8jnD2NK4mq0XXP7/ErfXQs63B7Al4AK5QioFI6WjhE4Z26LwJqf+W9OBuMyG9uwz0yCi
         V/mxAayFwqgmz6XBVEFFyY6G3FD3twnRBEe68CEx+vbyyyBk/8Y7xk5mIkImHsH3VNLt
         5FxYvrIJXUgWACpUZEBaDGc1kc+EsX8xrmvZX/vLtS3KwUd72kX145WvUICf0iYuR7Bg
         pUWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNmCEL5jwETaPyrW/H6EgRZvgGUln1Y4SVLpByWYLFJwCZUh9dNfFdLFta/8ERibZ5HQUA+ttEtom0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4KfNAWc+DJuzm9IpqAT4nAsLUOqKjO+QHzfaGj1PQLQxt26oj
	YVOe0cS//Fy89R9+V0GUybw5dr6WmM6rq2necXg7krm/z+QSARYDTD1L8+Lbtea1Q1tqKzqOuIx
	cmMmowVwWywELuV+LCeJB2mZefJzFaB6hT2wZ350toLBj508QxbXkkUk9/XUxuVLa
X-Gm-Gg: ATEYQzx+LsimuK5xCjCPAouawY/uionS+blLG4tsYbWGgLEjIh3V4aD/vxP9F+wxZ/m
	livFmFk9bwRi2rlkGQY5sAGTOr1B6UTHwGut28Qs8ZheRs0hdrM173HMV4wx9xd2so5FZHKmyET
	p3lf+IX3Ibyj7Zj0ThSC9Fz3/s5vj2t/ZKzCRz9jv2WB9R1zu2aOoKlTTZbcEY5BO7jLPb/qUse
	IQXVq2UQOCF7QZFGZkuzCho1mFSUUN3hQqDxxClYj8hFset5xCwYAYLFJ4FoEvGIEe8y6LWrTAG
	SsAHi9juWGsbgONtyjPAiOng0eAWUUBNrBz88EejamKnKo9dVZ5gzEUcPM7AM2oGMMPr+dcaCVW
	qIp5cNHkkDuMZPPjT/fyYQKSA9NUcKKq/09rCiuA41vW31wS8TmM=
X-Received: by 2002:ac8:5809:0:b0:509:1470:d3b2 with SMTP id d75a77b69052e-50ba3971756mr195340671cf.60.1774948258690;
        Tue, 31 Mar 2026 02:10:58 -0700 (PDT)
X-Received: by 2002:ac8:5809:0:b0:509:1470:d3b2 with SMTP id d75a77b69052e-50ba3971756mr195340321cf.60.1774948258170;
        Tue, 31 Mar 2026 02:10:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:10:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] ARM: pxa: attach software nodes to the GPIO
 controllers
Date: Tue, 31 Mar 2026 11:10:46 +0200
Message-Id: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJaPy2kC/x3MQQqAIBBA0avErBtQByK6SrSQHGs2Kg5UEN49a
 fkW/7+gXIUVluGFypeo5NRhxwH206eDUUI3OOMmQ2SwPB6PIhn1TjmwoiXnZ+ujNUzQs1I5yvM
 v1621D09ltYpiAAAA
X-Change-ID: 20260330-pxa-gpio-swnodes-132a81af10e3
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gNfw92MKGJloH5lQFl0qvVBeXgsIWu0g+hx/PhbV3os=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+YY18VqKMyaaNEP2xBh6GoVyLgEbBUmLOVX
 z5izue0pkKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPmAAKCRAFnS7L/zaE
 w0XPD/sE80ZZNZDPihOYLulSEr5yH0iOGvbA4cdq0sAeudLaXjDpjqxHE+IV6EwcnPnGI7EITH3
 w/MqJzDgk+pULKJKOFEwDzZMoFsswx1AeVc4fz2ZNGECmb3T0WqxvRXZME96VV9ZTHSK0ePSLo1
 KS53PLpq0yFeLKgvGrixs6AwvoEPYJ18PVAuoTB3JEQfoSaC7BLnV2g/PXf93HKniEKrxgfh1fS
 6hOCj2PgjsFUEZEYFi/u1NhaUZTd4e+8BnU0HHZJyG8LaKQ9lt0ycFHhC46H9VuQt2ijK4Jwkca
 qfBzUmP7PCO2SUsMJGY5djSWWNGkrcguI6jZC5h6i6DoRDjhQyU6Zv9ZRIEshnCIRD0HdRB1JB8
 DN/Z8iem9oZPayCjAhBHrGHLJb6dEvLUEJAd2ifUgjyoSnSCtHwYUSHs1tjoyJePEpkIP342hCn
 YSJDmR9CaGnmD8gVo81t02SFZbKFJrnJWgLznzpARWOKeJK1l5jtFQZkLzLaXGq75yJ8WOFgXo/
 DeftNMOm6dghNVglOYk8aTb6hn1Z5Pqh7Xc0E1pmwokhPhI9Ia6kbpAPqKJslxNeODegDHFaPmi
 PAbkfF+7hs2L3Y0L9OYy+R9ueAMU8JMlFDbBTfn3T3mQ4G9zgbdZizHZ/Kil4zKi9Lw6/Vq2C4c
 5fcNrAyypiBO7Fg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cb8fa3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zaRJeZBJaPDVN_C3E_YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eSGBH5vnxmxqPjVYHrDconXGhnEJW9oA
X-Proofpoint-ORIG-GUID: eSGBH5vnxmxqPjVYHrDconXGhnEJW9oA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX14Fz08ZnvNzT
 Rupo/xdoRVKyD2xmt+OJd5vrBNa7BD+iimawVdNTa2ZgwHqQJzZVDr1VWOYi8Mmuw55PfoNJdjV
 JOR1UXw51dknJDEIdvQYkK10oxLRuMec2DRkf+VWA6KuOxkh+XhsmiH25oPz1IOjScBCfcBN6lf
 V8MaF2MtEwTsnGJGaKpLjB80IqC7t/Bkg9DHNgKSRNKmwok6Zlgk8U5SNSfbmM62Um7boT+YCK0
 Y6zI5shYTbTQZF+Mwwe33iqEJMYBVybZQApmtCxdQhxTaBz7YbYJgEZFAQ1yqAtDDOTQOsot99O
 Qb3oTWvFsCQQ2nf0CvFpejB5p8Xn6U6lx9I8P0tMgIc3ujjD7ehd95ewZw1qTO7sZd5oAupEeX/
 LsuUG5hGzzt2n1RGhn32Wq7vGzQFy9wRdOitPMjU7r8c6NhJgSYR4bMe0/heHbaXzTFPVGftBDh
 KJaX3VssLj8VkzDSBuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34465-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85E30366DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I was looking for a use-case where automatic secondary fwnode assignment
would make sense for a DT platform. With the paz00 issue having been
addressed by Dmitry, PXA looked like the last one that could match the
idea but it turned out that we can just easily attach the software nodes
to their controllers enabling fwnode lookup of GPIOs.

After that the only GPIO consumers that still use label lookup with
dangling software nodes are ACPI platform devices and a single PCI
use-case. In that case, I won't be doing anything OF-related and will
limit the x86 tablets series to an ACPI-centric solution.

With that being said: here's a series attaching software nodes to GPIO
controllers on the PXA platform. Since everything happens in a
bord-file, it's quite straightforward.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c | 5 ++++-
 arch/arm/mach-pxa/pxa27x.c | 5 ++++-
 arch/arm/mach-pxa/spitz.c  | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)
---
base-commit: fd74e29ef736c1098bd2ea77e3129b532383bbe7
change-id: 20260330-pxa-gpio-swnodes-132a81af10e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


