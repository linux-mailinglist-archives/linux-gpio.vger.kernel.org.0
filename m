Return-Path: <linux-gpio+bounces-33318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K9mBkC5s2nbaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:14:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7903827EA4C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93AB631B59D8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE6C36C0A5;
	Fri, 13 Mar 2026 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWG0GFy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5VI4BcQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB136C9D6
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385755; cv=none; b=s7hRNNu8L53aV3zZ8gfrNf8GNRQmrh2l01CstgoQiJtf0OnufQhbi6YGFWP+YEe8aHoXtHpV+1AxL7j+cKG2PvIToqrpjRdteEuX0MMC69eL7O1SXnMKWOQWAK9Am4xMUyS2HaIRKFGBfKpFEI3lF2j/2S7aPdDnu+W6PabI1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385755; c=relaxed/simple;
	bh=dRR0utfxiVW1TMW7nZdLzpAZJ8WGa5nY3AdMtZ8XzxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mou2RUj8oAvzY2nzQa3IXdDxCn1IGyBTYWEwHQu96k2JsI6OPUYR23/WRs6tHoS5YxLIlOg9OTXlYVjs3c7xgZhC3b7dcn6O5rd6ZqAP9rW/3ezuEXSeQFkxpSApGmZrG2iadVtBU/okMP3cES4ELu8BbA/MRPkHprvbVP/fK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWG0GFy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5VI4BcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oX48793612
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQwM/wT8NrUVJJ28qh2UUCUaImA9dv9ckAeGdiv9hNI=; b=HWG0GFy+nIllQodp
	sgv//T9ux3X4dUhX5R8aQ3C/6SP6nS4YL66BQOJr2wY+YPZ3cwcVmdKtGe4AjtNT
	7VnvOzGl356XEeyHEsqZHz+RA4FTZk1TmOKfCO6i40xwliLFwbqbEyF0f95Rzn/H
	iiwtGSAAmUu7n7eU1j+EnJKPC5NKRw0ASVoyo7LwNG35gZ7Zajg1OrJJhSGtBe9X
	Hhz9Kg+IzOmmWdufPZ2r9ETVFqsuUBsLC48dNqJ4jr9oeLUNcJ/gn+Zz63GZ7a0Y
	wuFvZVfXfzs/w/QcTseiGu/ckZ1XHAwCsliryFZbTA5RyvrjAjOvGh4z+/TWT5aG
	L5HRKA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt020s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a0071f14eso10959259b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 00:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385751; x=1773990551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQwM/wT8NrUVJJ28qh2UUCUaImA9dv9ckAeGdiv9hNI=;
        b=Z5VI4BcQXVcXui61sM1GpzHXVbY4F1O8fOLgZX4Zb9ntLPEFo+CjqwjlibUuTsfz4o
         BsRwA/Vw5RTGRnWWfbrfjp383bXZcW6jnHWOsdrIhNf2j/7fe5xs0scCgNdIT62Jdmwg
         jSGWkPjmqEUmMrCtTpaWYMf80BAqbQaLlRVDM0zpd+ZBDYW2uFf6nQ+wR9BdDR30BtcQ
         tJHLSAzN7yGD6tib3/5tvZAG9SgGpLB8vqwoU/m5llHUyASqk9BLGdL13HBpuhYy+205
         cAJEmyY0dv9wqedfZ1UE5nAZJ9TxfQCbG+0VRAWGRl6i+F7ReNPzVhmu5Y8bYDImy0lN
         dK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385751; x=1773990551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lQwM/wT8NrUVJJ28qh2UUCUaImA9dv9ckAeGdiv9hNI=;
        b=RLj31YM44SzFeEOy/Ab2/RHRxl5Xa5qO5mb2Wx9+hFCMQXxXIwd8hM6FcGVmbo5AzV
         NyBTv36+dm56RANt8TP6CRf/fP4QKIlzUfgj73gib39AaqtVZbdISOFfhjy0rmFZOZkT
         3nk6sVpoycdBN5KbsRCgG6qPQov2mfwp4IlIOiVHTQdHD8YcmdeEka6yfam51WOPZvV9
         fWa65bCa/L/LyYznt/bY7CXPJB+Oow3hGpaJzpCaOyXPrFx6LeIySYN4ikUujL/qstlX
         VRXtQ5Fu2MQJcWAeIGOL7yl9kdHGsr47m/QifGRZCz1sxZxbrpaD8+sQLKGyXxK4sZPj
         DQig==
X-Forwarded-Encrypted: i=1; AJvYcCXM6ty5h1EStLWx/USq9sATV95OErtT4Xzm/xz3nrRkPauLldCjkSgXKx7YmMWmVhelJfUx4ykqXU/L@vger.kernel.org
X-Gm-Message-State: AOJu0YwXT2XMxp0ppGNhbKMOxIzDsEyvlNxZmwNQQD52n3UTJjPCyBdU
	KebrwOTjUE3TydkXuBxwWMPngi6zC9U8klAoA2pUt1yw8PYXwT30fDnwJOAv4TCVeG5Fhjt1OmI
	yIHHqXn0oRQnIRdissho9aUX85bbrWtlkd6rWAbzY8NrXn8fcDpa4a3KhxKRFMWme
X-Gm-Gg: ATEYQzyYmD1exIP4sqQ0Gvmu3mMbZlUZMbmGeA8j2sXErmS4Ukmqjufrsf/lqQ1dUxY
	WhKOxnfquXjxbVfQPOp2CtCLOytxkx9YAFW3ZgLoXfntuI+HYrhNATye7xFA2rNTX2G2HpmZehj
	HE5CWzqCHZrCRvlZUKtpaa+YrUoItExDeMaCqXWvNour8XI+p60b+gqwD0+yyJfSzvyvnV3Vidd
	8u+joaTohPKWYBHyl0orc6QduK5u9PG55JE9GABWvOUuZJShE7QTFIa4InEIs951NhgRy5dR1iB
	oGjdw+3Q7o3HJ0z8A+RXG4oQFRNdCcxGlCzr+q0SZxQwK+Ax5YDRpwGlohDfmW2x9GeODH2qNAS
	CcNu3f/6xhVETx7jV+ahoyjrQBqzsn0msb0X8m8AJEHR9L/CczF0VtstG
X-Received: by 2002:a05:6a00:4009:b0:82a:1428:da3c with SMTP id d2e1a72fcca58-82a198d717cmr1894916b3a.35.1773385750926;
        Fri, 13 Mar 2026 00:09:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:4009:b0:82a:1428:da3c with SMTP id d2e1a72fcca58-82a198d717cmr1894882b3a.35.1773385750379;
        Fri, 13 Mar 2026 00:09:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:09:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:42 +0530
Subject: [PATCH v8 3/3] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-wakeirq_support-v8-3-48a0a702518a@oss.qualcomm.com>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
In-Reply-To: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=9592;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dRR0utfxiVW1TMW7nZdLzpAZJ8WGa5nY3AdMtZ8XzxQ=;
 b=fLmhx0oZdoItLLNgEENY4IhUcvTmCA9X6MCXg7tPqlrQU/gJJ/fAAY5UgkWtvPpRYUe4UDDuu
 Rjg5CwFx6UdD8AojHu/6HJHeM70tcdQF6Fg21/Wp8jZ5jyA6odv0Ox8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3b817 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=XVdArZcsv8hm62BSzCUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kIj4eo_o5JCUzFykZOLwoiElf9DLWgsi
X-Proofpoint-ORIG-GUID: kIj4eo_o5JCUzFykZOLwoiElf9DLWgsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfX2wN3kPryFbqP
 7ypo0hCRMFnEQLZMUTewpNnGNv1jstfvRZPvI7xM146+tj4s0xbNhEw8hP7e1eZ8eBL3RUYV+Bh
 K7RbRA6HQxsBndAeEsIZTmUxTK11ZWvzKus2mO87umbRA7iojjeRo7q80/dfDNy6IvvNH1tk/U9
 KD9tEsQTwN8sl4Tq5kVH05LTY/k++6NMDtv8J9YfHBjIV5/hKznquzUHUMhS4hIE1HuzsNYzEtf
 f70Nuhy7z2VNm+jAxhz5u0aAthoGeEydHpIeB+KIV2HqRRHqEypGlIeYSt0BeTEFhn7bV24tTDg
 7pQDDX7obrc8+8u/hVczn6IWV9HvyrLefQy+d2gbKKYq1hD2clO72+zri0jcQbZUHDoem6bhl2t
 SyrT0uFPvcQdxcVcPkUmg9ZGp726G8EZ7IEt45wFd0DMj3FcDZEZwye57JsLHmbwhROeSVzxBTs
 olMrAt11GTCeYlB5mbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-33318-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7903827EA4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
hardware-only mechanism and is invisible to software (PCIe r7.0,
Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
the PCI core.

According to the PCIe specification, multiple WAKE# signals can exist in
a system or each component in the hierarchy could share a single WAKE#
signal. In configurations involving a PCIe switch, each downstream port
(DSP) of the switch may be connected to a separate WAKE# line, allowing
each endpoint to signal WAKE# independently. From figure 5.4 in sec
5.3.3.2, WAKE# can also be terminated at the switch itself. To support
this, the WAKE# should be described in the device tree node of the
endpoint/bridge. If all endpoints share a single WAKE# line, then each
endpoint node should describe the same WAKE# signal or a single WAKE# in
the Root Port node.

In pci_device_add(), PCI framework will search for the WAKE# in device
node, If not found, it searches in its upstream port only if upstream port
is Root Port. Once found, register for the wake IRQ in shared mode, as the
WAKE# may be shared among multiple endpoints.

dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with a
device and requests it, but the PM core keeps the IRQ disabled by default.
The IRQ is enabled only when the device is permitted to wake the system,
i.e. during system suspend and after runtime suspend, and only when device
wakeup is enabled.

When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
bring the device back to an active power state, such as transitioning from
D3cold to D0. Once the device is active and the link is usable, the
endpoint may generate a PME, which is then handled by the PCI core through
PME polling or the PCIe PME service driver to complete the wakeup of the
endpoint.

WAKE# is added in dts schema and merged based on below links.

Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
Link: https://github.com/devicetree-org/dt-schema/pull/170
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c       | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c      | 10 +++++++
 drivers/pci/pci.h      |  2 ++
 drivers/pci/probe.c    |  2 ++
 drivers/pci/remove.c   |  1 +
 include/linux/of_pci.h |  4 +++
 include/linux/pci.h    |  2 ++
 7 files changed, 95 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279ed28db7a3b2fd29c65da9975c2efa..b7199d3598b31b62245716c178a5a73565efc89e 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -15,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include "pci.h"
 
 #ifdef CONFIG_PCI
@@ -586,6 +588,78 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	return irq_create_of_mapping(&oirq);
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
+
+static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
+{
+	int ret, wake_irq;
+
+	wake_irq = gpiod_to_irq(wake);
+	if (wake_irq < 0) {
+		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
+		return;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+
+	/*
+	 * dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with the
+	 * device and requests it, but the PM core keeps it disabled by default.
+	 * The IRQ is enabled only when the device is allowed to wake the system
+	 * (during system suspend and after runtime suspend), and only if device
+	 * wakeup is enabled.
+	 *
+	 * When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume()
+	 * to bring the device back to an active power state (e.g. from D3cold to D0).
+	 * Once the device is active and the link is usable, the endpoint may signal
+	 * a PME, which is then handled by the PCI core (either via PME polling or the
+	 * PCIe PME service driver) to wakeup particular endpoint.
+	 */
+	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
+						   IRQ_TYPE_EDGE_FALLING);
+	if (ret < 0) {
+		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);
+		device_init_wakeup(&pdev->dev, false);
+	}
+}
+
+void pci_configure_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+	struct pci_dev *upstream;
+	struct gpio_desc *gpio;
+
+	if (!dn)
+		return;
+
+	/*
+	 * The devices in a hierarchy expose wakeup capability through the 'wake-gpios'
+	 * property defined either in the device node or in the Slot node. So first check
+	 * for the property in device node and if not available, check in the Slot node.
+	 */
+	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake",
+				GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
+	if (IS_ERR(gpio)) {
+		upstream = pci_upstream_bridge(dev);
+		if (upstream && pci_is_root_bus(upstream->bus) && upstream->wake)
+			pci_configure_wake_irq(dev, upstream->wake);
+	} else {
+		dev->wake = gpio;
+		pci_configure_wake_irq(dev, gpio);
+	}
+}
+
+void pci_remove_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+
+	if (!dn)
+		return;
+
+	dev_pm_clear_wake_irq(&dev->dev);
+	device_init_wakeup(&dev->dev, false);
+	gpiod_put(dev->wake);
+	dev->wake = NULL;
+}
 #endif	/* CONFIG_OF_IRQ */
 
 static int pci_parse_request_of_pci_ranges(struct device *dev,
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8479c2e1f74f1044416281aba11bf071ea89488a..3d858f36ab48a6daec645574ca9027d9d6f071de 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/lockdep.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
@@ -1123,6 +1124,15 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	return acpi_pci_bridge_d3(dev);
 }
 
+void platform_pci_configure_wake(struct pci_dev *dev)
+{
+	return pci_configure_of_wake_gpio(dev);
+}
+
+void platform_pci_remove_wake(struct pci_dev *dev)
+{
+	return pci_remove_of_wake_gpio(dev);
+}
 /**
  * pci_update_current_state - Read power state of given device and cache it
  * @dev: PCI device to handle.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6698514d92500dfea03cc562cdc2..65ca9551e558d2e3331fab0a968620d6b2a2522a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -282,6 +282,8 @@ void pci_msix_init(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
+void platform_pci_configure_wake(struct pci_dev *dev);
+void platform_pci_remove_wake(struct pci_dev *dev);
 
 static inline bool pci_bus_rrs_vendor_id(u32 l)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd794384b7877d453c7989941471c999..372b0d2f4531ea53c0570608306a547101d59e7b 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2771,6 +2771,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
 	pci_tsm_init(dev);
 
+	platform_pci_configure_wake(dev);
+
 	pci_npem_create(dev);
 
 	pci_doe_sysfs_init(dev);
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index e9d519993853f92f1810d3eff9f44ca7e3e1abd9..d781b41e57c4444077075690cec926a9fe15334f 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	if (pci_dev_test_and_set_removed(dev))
 		return;
 
+	platform_pci_remove_wake(dev);
 	pci_doe_sysfs_teardown(dev);
 	pci_npem_remove(dev);
 
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 29658c0ee71ff10122760214d04ee2bab01709fd..0efd6e9cb4d3d3beaafb42ea411303139f1150d5 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -30,12 +30,16 @@ static inline void of_pci_check_probe_only(void) { }
 
 #if IS_ENABLED(CONFIG_OF_IRQ)
 int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
+void pci_configure_of_wake_gpio(struct pci_dev *dev);
+void pci_remove_of_wake_gpio(struct pci_dev *dev);
 #else
 static inline int
 of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	return 0;
 }
+static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
+static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
 #endif
 
 #endif
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..d1e08df8a8deaa87780589f23242767fdcdba541 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -586,6 +586,8 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	struct gpio_desc *wake; /* Holds WAKE# gpio */
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */

-- 
2.34.1


