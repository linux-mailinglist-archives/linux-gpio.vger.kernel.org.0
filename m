Return-Path: <linux-gpio+bounces-32552-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN/IMeNSqWkj4wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32552-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:54:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A400520F109
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A707D306ACFE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A69B37EFE1;
	Thu,  5 Mar 2026 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSg/4hJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bj4LZCmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05437BE7E
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704321; cv=none; b=ZP8CXrVLHd/oCxEF/0XLQxFgf3ly8KDDami7F2LQ0lqLPL64RHPqmxXgE447RAhI3ebjiFzcggiHxrlOxcZTpW21Y/JuJBEGAJ9qKAXWWd0DyOCVFwiKVQOMoY4pV/NhyoGaAlRe9MNLiMCh3jYx4Oint0+hO3bpVtR9spf16C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704321; c=relaxed/simple;
	bh=nHHCSm94RSmEIVpUlb5PB0C2I8hqgvSMHOW0imJuagM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1h9RZLMS4YLQaH1sFn7cFT0i07/VA2QgVXpfLpEmIQoEOO+snImxx0HpDABXsjEG4azkfVysvaOXVlAXH3fJsIAxV48ZtJ+BWQebEc0BccPX5uh3L9rFx7SpMz3QoVb/9ijetPga5iVOmzLQXWuEqBt405TkpDMo4eoEaOxorE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSg/4hJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bj4LZCmJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259BTxY3160488
	for <linux-gpio@vger.kernel.org>; Thu, 5 Mar 2026 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=; b=jSg/4hJghyJX7lU7
	UqNa0NeFSNDZTu2aeyWp+WKa8GFkTQBkF4JpTzvgoE6DsaalJjvMwNzhqeVwMugr
	wNt6j5clx/9FfcwA03lArVyuABsLpfefsK4uYJk74G0QOSsPs0waA5+b0vxoXycF
	5On7egWWivRCcT/cY/X6ZqFJ4TyMVEkdBDFaaQjVtmrBlzbrl2t1VDVWKnAMvntK
	OwirLW3Hk8VdDxZl5syi0QaUPGUSMRC2P2eONS7pEPFqESjFtwDnJbmk4Zk8Nogs
	Xn+dltxPgSn/YhBQLmUDCD4bkD1t7/JeqwT1R8blXiaIBsV0zd3Y7k0XTQap+Dad
	hc3KWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v4y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 09:51:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b6b37d8so4362426885a.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 01:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704318; x=1773309118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=;
        b=Bj4LZCmJyM0jeD9PWWmLxXcf0BQJyA3LITflcd+PpUQXm6WcUSZljdBfyMtfMBrFxr
         tVBY/+xY5P6bORGQDyzONOJLec9JC+ja46VJhaqwTV300aTgHuNGkkpR8mIj04QCYDbk
         adiG0lt5JoR5ufBIwu7MkK0IqbL7yAFXRgiMW1uqNTk3Og8quu+wU/IbMqzQYtZqqIFi
         6xajzRGMuztJXaoGeRH+YSL8o9Gh03uI6Yqn1vovrPrNkNQvBhAECUsAb3Po4tjQq9Oi
         5hoIjIdnIG+uXcW9MD1sKaHjHkJPqsFrh68DwVKl7kIMeIwOYERTq/hSai/BzdFDzyRn
         r5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704318; x=1773309118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=;
        b=d0OhBbKlRjLFpVL2tTUWeJHQ0RU/j5M2XUrbWjrnw+5Y3QcyaB+EAZo0IsCSBFW+Mb
         T4FK7axxNNQ+6DvymJhSTgEK+kuuMPb+eneBQpT4MTjhChz1CctsBqyMJmpMeXfI6K41
         yZpfZZ7TEns5tay9/V6VRXL3i0s0pAmLGSjbuyNPFxwgS2LxIzcxO7NAFkgaCDxPOuDL
         xdHMYS55oMGx8X/JAOhkMTtyxEdLBoRLaK2QuVWVH9NKsX0ZHM1CzHODb/wKTQ5kylnY
         5dWh4WMSvT5E70qZ5u4+YSjSecW1PlE6Cnj139q3oCQExb0iaAQKDAaGIn9qhG66o5lt
         hO/g==
X-Gm-Message-State: AOJu0YyyuJ0XiBYejj6ukSY417tG0oP7MsmS7NQk0yns9gwgzjlEoqp9
	1jFfRMDV+weEXG6aCiIgYAusCaircV9nDx48rwfetlHw/xRGb15RCCBoJ6gDOeFOmGkdlRCkx9f
	Kz02jbJteWHDHbaXZEhwz2aDAaw8OQSgg7QwyeosERa+HVt95f2oUseD3lvBpomMr
X-Gm-Gg: ATEYQzwkvsSyncuEu4ER7P56mSH3BmfvLwXwQyEsL8qu7dS0xQcUHCsffghw9nzHKn4
	DsP/ts48pCr4iDEQf5kx26NRwLfkYVGqsuWVZU0JtNWlukkLFG0oZ9K3x99/wEb2c6FfRcYbJdM
	DswX8eMrREc/vYyf7PA4oshh8TbqbKYSpQE/Amv9C6L5t0AEf02Gf5kBNjXJXMlCVmoW0tS0VlN
	7xak9WqfwPriJjAC8hLzBAgTPMxheDHMnm3dp5PH/3EYkNFnhxin8METZYd0SaRCBF8TsDLXxNr
	bzK1XnDjSDm9SW1VPmbJczMmP9qZsfli+r75nHoCdTm6+QXfUopcOD+TQ71PkCUXJBU0OOmpDXb
	+MP+pkO+bb4VelBufjKza9U/8UVoxy8v4CFKbSujP9iCEKvUIgiGk
X-Received: by 2002:a05:620a:1a94:b0:8c6:670c:953f with SMTP id af79cd13be357-8cd5afa51a0mr579593785a.58.1772704317657;
        Thu, 05 Mar 2026 01:51:57 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8c6:670c:953f with SMTP id af79cd13be357-8cd5afa51a0mr579591885a.58.1772704317222;
        Thu, 05 Mar 2026 01:51:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:30 +0100
Subject: [PATCH 5/6] gpio: remove machine hogs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-5-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nHHCSm94RSmEIVpUlb5PB0C2I8hqgvSMHOW0imJuagM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIr3OTbQ+EhTR/0KOPIsw7kVLs2Ax4N5tZgk
 wRj0KhbwzOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKwAKCRAFnS7L/zaE
 w8qkD/4sUoU6WuCaaKi2i05/0ZwSbE8TTFhBiPRiYDkdfYLS6WyiOS92WfOTLqKUORwgNJLJce7
 0he2vPpJWv8I5nkqqglm3uo4hudl7P9RwR8tJnmUyt8MYPoKqNRJex3EC9r4Ud349DlvZ6zr7T2
 PWuGqbTlNlY2qvulNPAM9PnvLU14dwT4Kw60jacWu6SzA8FpX8PSDLQYgayVxVaHf624BU3GIjp
 Xjm+lnPeVRt2m485svet2KXR3UfJTWMC9QkWIZJfwM8PCNtviAvdSBBQMgOpKXKL5T3IZGSj6Op
 wHdAkU0u8oT3Coc0JQTKRmZyQG1wtyoKJ5qNrwCoVJoNUL7NhEgP2xX5Ordg286h4szTMSwsRux
 2KqcC3+Om7DAWIA6ZSRjIIhL5zkNvQ1N/3KN6NmQ2+RMnK+fw5WmrqcIE5igotMCNGdX5wWWiWp
 guEtIXSTXIg5teWGUIx4sLQaL4Sb4cB5jjrGWBUCH65KzsVTf6THOyyW48SIXDzUqqOk5t1Bp+4
 s/TzXkY8lfm3VCmfqsEZZuccywZVEl5AEAX30YAtEYJeSRIfgduGmKMi7byO2CT/zv72YxHCZsd
 QYcKlgEAOGe9yEAFXwhmTQLZjLj5aywhBnJ2NKBwVsXJk9TZvilTgRHDA3inVwXpiJjoIPtYheC
 HhRpJgAzingRmUQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6o2SnVscqgVGCvW7aH1MRdqFNC__5yXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX+ssXaNbO68LN
 I9OvJfYMZ/4oOU0eJccuMoKoviC8KSEZiYfIf/LKSORAq96AQ3XpUXGL0z9Lf/jUxSGr9ABLuIa
 +rylJZLwFe0MnJXZnTJXlNcfnA1nQdU3CiOjyJi8pkVxn/X2FKYiBvr99h4fW6au98K1DcJ7hPC
 2fkn4OlU2h9/eG4eLJKAgMCDusMaiQGz7Dvish6EqtZEIl/09uls+2XYb42pBCNnZITx7h8to+Z
 4dFmRts9RD1kAPx48O55gQ295b+a+DB9DV+Ih51ny0aWTMgaxFcETMU8WWY51VmCT7LChy3uIqV
 uxPpdBorIsVslp0/Mt9L2vOPEx1Xg0vuyyaw1J8ujwnTPiAslpu7lM0EL0LXEjCc9DAugIn7Vm7
 rsQGWGJrK5kB09pIZ8qMSR3pDt36v6lsz73Yh0NT2PkImmtxFlsBX0qeHLSg5wIX3MBhyOR5G21
 5BUlVkdoS18lJM1V+Ig==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a9523e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ljULaDYbSg_dSHWjUBoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6o2SnVscqgVGCvW7aH1MRdqFNC__5yXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-Rspamd-Queue-Id: A400520F109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32552-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

With no more users, remove legacy machine hog API from the kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/driver-api/gpio/board.rst | 16 --------
 drivers/gpio/gpiolib.c                  | 71 ---------------------------------
 include/linux/gpio/machine.h            | 33 ---------------
 3 files changed, 120 deletions(-)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 069b54d8591bdeb975a6c650d643db4f7eb98ab7..0993cac891fb5e4887a1aee6deae273197c6aae1 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -239,22 +239,6 @@ mapping and is thus transparent to GPIO consumers.
 A set of functions such as gpiod_set_value() is available to work with
 the new descriptor-oriented interface.
 
-Boards using platform data can also hog GPIO lines by defining GPIO hog tables.
-
-.. code-block:: c
-
-        struct gpiod_hog gpio_hog_table[] = {
-                GPIO_HOG("gpio.0", 10, "foo", GPIO_ACTIVE_LOW, GPIOD_OUT_HIGH),
-                { }
-        };
-
-And the table can be added to the board code as follows::
-
-        gpiod_add_hogs(gpio_hog_table);
-
-The line will be hogged as soon as the gpiochip is created or - in case the
-chip was created earlier - when the hog table is registered.
-
 Arrays of pins
 --------------
 In addition to requesting pins belonging to a function one by one, a device may
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be2e6ed0e744c23939491717a060d3a8456c842b..e732427e2a975585ec873a5240ab92e3a4cf187f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -103,9 +103,6 @@ static DEFINE_MUTEX(gpio_devices_lock);
 /* Ensures coherence during read-only accesses to the list of GPIO devices. */
 DEFINE_STATIC_SRCU(gpio_devices_srcu);
 
-static DEFINE_MUTEX(gpio_machine_hogs_mutex);
-static LIST_HEAD(gpio_machine_hogs);
-
 const char *const gpio_suffixes[] = { "gpios", "gpio", NULL };
 
 static void gpiochip_free_hogs(struct gpio_chip *gc);
@@ -930,36 +927,6 @@ static int gpiochip_setup_dev(struct gpio_chip *gc)
 	return ret;
 }
 
-static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
-{
-	struct gpio_desc *desc;
-	int rv;
-
-	desc = gpiochip_get_desc(gc, hog->chip_hwnum);
-	if (IS_ERR(desc)) {
-		gpiochip_err(gc, "%s: unable to get GPIO desc: %ld\n",
-			     __func__, PTR_ERR(desc));
-		return;
-	}
-
-	rv = gpiod_hog(desc, hog->line_name, hog->lflags, hog->dflags);
-	if (rv)
-		gpiod_err(desc, "%s: unable to hog GPIO line (%s:%u): %d\n",
-			  __func__, gc->label, hog->chip_hwnum, rv);
-}
-
-static void gpiochip_machine_hog_lines(struct gpio_chip *gc)
-{
-	struct gpiod_hog *hog;
-
-	guard(mutex)(&gpio_machine_hogs_mutex);
-
-	list_for_each_entry(hog, &gpio_machine_hogs, list) {
-		if (!strcmp(gc->label, hog->chip_label))
-			gpiochip_machine_hog(gc, hog);
-	}
-}
-
 int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 {
 	struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
@@ -1049,8 +1016,6 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 			return ret;
 	}
 
-	gpiochip_machine_hog_lines(gc);
-
 	return 0;
 }
 
@@ -4584,42 +4549,6 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
 
-/**
- * gpiod_add_hogs() - register a set of GPIO hogs from machine code
- * @hogs: table of gpio hog entries with a zeroed sentinel at the end
- */
-void gpiod_add_hogs(struct gpiod_hog *hogs)
-{
-	struct gpiod_hog *hog;
-
-	guard(mutex)(&gpio_machine_hogs_mutex);
-
-	for (hog = &hogs[0]; hog->chip_label; hog++) {
-		list_add_tail(&hog->list, &gpio_machine_hogs);
-
-		/*
-		 * The chip may have been registered earlier, so check if it
-		 * exists and, if so, try to hog the line now.
-		 */
-		struct gpio_device *gdev __free(gpio_device_put) =
-				gpio_device_find_by_label(hog->chip_label);
-		if (gdev)
-			gpiochip_machine_hog(gpio_device_get_chip(gdev), hog);
-	}
-}
-EXPORT_SYMBOL_GPL(gpiod_add_hogs);
-
-void gpiod_remove_hogs(struct gpiod_hog *hogs)
-{
-	struct gpiod_hog *hog;
-
-	guard(mutex)(&gpio_machine_hogs_mutex);
-
-	for (hog = &hogs[0]; hog->chip_label; hog++)
-		list_del(&hog->list);
-}
-EXPORT_SYMBOL_GPL(gpiod_remove_hogs);
-
 static bool gpiod_match_lookup_table(struct device *dev,
 				     const struct gpiod_lookup_table *table)
 {
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 44e5f162973eb6f6e85188f56ec34e1e3e2beab6..5eb88f5d0630f83b6a3a0e6727103c319e139b27 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -46,23 +46,6 @@ struct gpiod_lookup_table {
 	struct gpiod_lookup table[];
 };
 
-/**
- * struct gpiod_hog - GPIO line hog table
- * @chip_label: name of the chip the GPIO belongs to
- * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
- * @line_name: consumer name for the hogged line
- * @lflags: bitmask of gpio_lookup_flags GPIO_* values
- * @dflags: GPIO flags used to specify the direction and value
- */
-struct gpiod_hog {
-	struct list_head list;
-	const char *chip_label;
-	u16 chip_hwnum;
-	const char *line_name;
-	unsigned long lflags;
-	int dflags;
-};
-
 /*
  * Helper for lookup tables with just one single lookup for a device.
  */
@@ -95,24 +78,10 @@ static struct gpiod_lookup_table _name = {				\
 	.flags = _flags,                                                  \
 }
 
-/*
- * Simple definition of a single GPIO hog in an array.
- */
-#define GPIO_HOG(_chip_label, _chip_hwnum, _line_name, _lflags, _dflags)  \
-(struct gpiod_hog) {                                                      \
-	.chip_label = _chip_label,                                        \
-	.chip_hwnum = _chip_hwnum,                                        \
-	.line_name = _line_name,                                          \
-	.lflags = _lflags,                                                \
-	.dflags = _dflags,                                                \
-}
-
 #ifdef CONFIG_GPIOLIB
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
-void gpiod_add_hogs(struct gpiod_hog *hogs);
-void gpiod_remove_hogs(struct gpiod_hog *hogs);
 #else /* ! CONFIG_GPIOLIB */
 static inline
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
@@ -120,8 +89,6 @@ static inline
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n) {}
 static inline
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
-static inline void gpiod_add_hogs(struct gpiod_hog *hogs) {}
-static inline void gpiod_remove_hogs(struct gpiod_hog *hogs) {}
 #endif /* CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_MACHINE_H */

-- 
2.47.3


