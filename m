Return-Path: <linux-gpio+bounces-37931-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gb+TJfouIWoXAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37931-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:53:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5263DC69
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:53:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qv9kuMVG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HLH+eJbw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37931-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37931-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E0B530AC5D2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B4E3CF049;
	Thu,  4 Jun 2026 07:48:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202F3D75A6
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559325; cv=none; b=Os+MXDIh7D5Y8S2oCazhDwN2qgoLTDlLLkB2H5VWOERBmb5RSybPlC+y9VZSKXhhAtlMrC0nb6OruakNtWZjGXRvezgZN4HwOpUKh38t1TxJNRuxBFFtr2EVHatQWVpP4gW9ex0NVFxUV2Y+5I9TuieAdju2QsKuY1eAqB1XS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559325; c=relaxed/simple;
	bh=6pNDjgjDF/WKj1+/MMqT6R6o42kbSujyd1lzDNCUqBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwx03LrlP5MJfWHTvyTfnyfgrBS26zddefWnNw4i9G/evt/L6cBHcIOt1tElDBH+DLMs/Sm0FvniZHCB+99cWXfT8e7gENqt2hdkEgdXdEv60G9nK7+D54EZewbbxA3qHbHcks5IbF1+4wdvBpzMjS9Q/VHekp7QjGyWBbPWW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv9kuMVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLH+eJbw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540o20k313888
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBg1O+Xt4Q53Hq1Zi8Sg0k+lC5RJ29mLW5jqZy6+ArM=; b=Qv9kuMVGLc90ZUHm
	xEF9YS/RgwbzMgYs2MjRaRmrJT/Dfa/Vy0T+GFXGtBNIvXW7u2Dm4xeK/vO1h1YI
	+OQeWPJgo3UuxQoqrefqJI0E7yPhegtTM/1Mm7pG/ytftcPjAvdaZ94Eu3t00K4Q
	jE34XY5XVa1VPwMjV/9i/+C5++uGui4DvRRFopnxY6JduTsKwULYJgm2wMzPRHSS
	bbLyJQjUZYHi+Ob+USOtrtHFD8U9wDWmA51zPjgz+qLMfKqfHIRlN6aB4quX/jR+
	kelzQKLLXiR21AgVKwoxa7frxzoJ9InIJ3HSYhQX602qP1TBvv9HdFUihF9SJRB4
	eRk8BA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v198d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so5012711cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559323; x=1781164123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBg1O+Xt4Q53Hq1Zi8Sg0k+lC5RJ29mLW5jqZy6+ArM=;
        b=HLH+eJbwh1n87nBb8EM4ebpTotha5BgUaORERE92zYxbhXFMwwrBTA9JW4tb6Jq1ji
         a+G9N82dxH3iOHfCEcFpzi4nLzVc3epYEArsn0b7xfB9eGdW+dsIwiNCIr8S6ASwdjWL
         TN9H87Roz6ZAjJiUnyOEqOgNscJQlClhIj+F1OnMjwsj5kfYX1e1UQmaEgUVuXHre3zl
         wRMDE0vF394Vv8sIUDnqzwpJPLCNLzLuDRY05TIjRU0JsdOJFkUFuXpTe1ygrmxBElrH
         AtRwRi8T0AUt266JtdsbtY/vF3ez3FsJ4fn8RDT1p/RPTyWJ4TXfvyMMg6P5MBrft6zs
         VAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559323; x=1781164123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XBg1O+Xt4Q53Hq1Zi8Sg0k+lC5RJ29mLW5jqZy6+ArM=;
        b=OOv7mdvFaNwQSoGHdvz9Vm5SRpYtqbglTensGu12nv0iUHrWjKvZ5ybCgjxqHnhfx6
         wz/gJ5QMWrditP5m+7ORZWDiGFIfpcoaYiHp75unXjWqxmO+fYk3d9tgUW4uQCKbKj/n
         UF5U5sgVTPwoRSdC96gsYJi7F6Gi6VAVJxPH9nFGxeFMKJ6GD8kPTpNexfE4e05M7tIS
         i9JydTUrASovVAjQWhU6G/R4pED5BpFNC6+PeaKpNwkcWrZwEy0BWHaFuOQ+X+Fc6WA+
         J8Si8UjOxSrL+53Cufc2Dp7zNvk0lYN7e1fdB9CBtQ/4OJrpJhz7aoogJEGxuPhUHyc+
         E3kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gkLdn1qShzFqj/Bh2YPUJLQQDKYp3qED8iFaCO+Ycd7+NczIYRnkqWop937u23XMYmTHr2bUuwrzC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEazmJAR4BVuDizieiiV6/4n+F25O70M7nCYxvL5xHdeoqx5l
	7LMfl8a+POg5k26mH1anyganHKk35Rt+nvZ07eBgLZMlEQ/YEwEB8FO+T94zICpeEJ43jECKlmn
	ewC58/TzHEqfsr2WqaGG22Xg2tNX9N3M4AEqRHI7IdbIE+YhBsf5NHJD7qdBgMo9ObQ2IYx45TW
	A=
X-Gm-Gg: Acq92OEt9k6M7EMIW8jOG/ruqQQ8yT+F1d/LqKNE/105sUb65VT3fYJMOcfZ/Uo55p1
	Fx09Im3FcQ3SURSM1Q6NRdIqF7VI51GSMJjMwFrEeFhnn+YvcStXsyplwrIzsUw/wH9Y/qqdohf
	siNFqygl+K71a/plDQk2OVtxbnPd3o7xIFN62NPJLczcJHWF2N91H52uVmPCO1c0Hslb/zWvhZ3
	dVkSqHe1GpelxVKQx5CjsFqmx3hFtZUiDRiYh/TU8gWbXumN/cvXkz+TxaTZ62X6mNRYUE0To1L
	sRFnMWZ6F5YfibM2NhwG4mOG/wP6A8MxeLbtxAtfg0cA1X4mHykZTUY+ktrn/JJYu72WrckxPkQ
	673vibGQG/IEwUdPfsGa96FuqV5lyX+8M9Vy89opFpUDqHBoyLn1Kd68f2zTVBiDBqkM1+NTir3
	8fCJ51dH8=
X-Received: by 2002:a05:622a:56:b0:517:723e:817c with SMTP id d75a77b69052e-517785c9ee4mr104642981cf.15.1780559322506;
        Thu, 04 Jun 2026 00:48:42 -0700 (PDT)
X-Received: by 2002:a05:622a:56:b0:517:723e:817c with SMTP id d75a77b69052e-517785c9ee4mr104642771cf.15.1780559322025;
        Thu, 04 Jun 2026 00:48:42 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:56 +0200
Subject: [PATCH libgpiod v2 13/15] bindings: python: check for errors after
 PyIter_Next() in set_output_values
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-13-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6pNDjgjDF/WKj1+/MMqT6R6o42kbSujyd1lzDNCUqBA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS213jMS05NO1/iUC0ZhbDX+h6LLgLnRDckMR
 RRFnmSrkriJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEttQAKCRAFnS7L/zaE
 w26uEACroXoFPzja6RlHrOuriQ29CVbQfnexqXx71xIqiBZlwDtXevwOBbn7BnmYUaN2flXYRrL
 6RwhoplLgYtAEDAxJ9jbqXuleJ7ye0uDLi5vagbi5/gdQVk6JG2ZGRfWoUiS2MQ8ifIl307HVt6
 HEMJf2yZi+FER4OI65wUAQ4riutm6sHxJrH9ogup0N3TZIlI7blLDGmjJgxwiAjyryK3XvLrZY9
 z9UBXVybKnvXEUytGD+noICOB4e+gpoFvALmDh8o9EuvqLm5pSqdjl3TcjCKIK/Q7yHV1M+vg1f
 QNZdki8KJZHkTxr6ykR2qoh6/tgdUtOVsG8Cv5j1tOJlemN4G4b0HWWkv97Am/NaupxorcY84Dt
 AHm9LRrFCh6Z1Cu46hWhFTRf7IPO/RI0Xz0APecUoUO4cleESmDUvWHagv/AkGfkI8hdBtzXkBZ
 FtI1XlpO4Y3aoCBl1Ebfg44k8cdnmdWrL45GfI5Xtl9p1k3zrEp0mBgcBy32KQRREZNQxKA6F4c
 28TIYv03aZG3yL5vb7nADWBziFa0h5+d9PDBnlYOV/C7N/DOYzcX9Ws+nS8heS4pU07V8jfFkJ1
 PQ+XU9ZBeqe7UPyebhDHWhxyK21yNIllbIY2JYY/k+DHVSR6dtbfQE5lB1lT/uE+fAKKcZWam3C
 fSGgaZ/UJy1V+bQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX7mvlzMQR+F45
 MbLVU1lJcwAVVkSiLLSAkehP/6KHcOx+hnClywdgwVPkTUOCnuu3nd6BDlfAblNW5oCx/wYWjFn
 VQCJi8nTla4ZbQxCbYvg5TbuG47mAeD4S2OINPZjZjM1cOPmD8s+JZ3XgaZzKj2fbdHdRTLPFiu
 9rTRzuXnI10SlZRzG2JstvVZNB3dIVDjoTgawbolFaORhBr+fo6xnORA86uZxYxiarEV22/nsuR
 xTQDz0msamv7n0BEv1moiOkjrJsEwGAH0/4WpiqQvFyqFNmJPWxv8nIiWjWL9JLetrVvduR6TH2
 sPDYiyeOBbpPfw+ZuIqS+MBTgsTXn29GNsBpkfU6MDifROEocfo+kdObWwDqwaLQ8VXETaoGeAc
 Yb2IykPoBhwzoqINlZfe07DLoNL5bNcnhiTIHLnag5niDQ7qK9qJEqLSXArYlUPSwXWyyWnOFJv
 l87GZWsi/A1LpUdmHxQ==
X-Proofpoint-ORIG-GUID: VcPq9FdAShEZ-FOn0XkehjQzu52HdvVW
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a212ddb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FAUPNU62ln0xYUfGZxAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VcPq9FdAShEZ-FOn0XkehjQzu52HdvVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37931-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09A5263DC69

PyIter_Next() returns NULL both at end-of-iteration and when an exception
is raised. The code breaks out of the loop without checking
PyErr_Occurred(), potentially swallowing Python exceptions and continuing
with a partially filled buffer.

Add the missing error check.

Fixes: 27a69b0bfd4b ("bindings: python: add the output_values argument to Chip.request_lines()")
Assisted-by: Claude Opus 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/line-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bindings/python/gpiod/ext/line-config.c b/bindings/python/gpiod/ext/line-config.c
index 0bba1128287dc7e52c8636ce81b2e30584e15277..1b284ecb484cf554334bcd9eedc0093dee976062 100644
--- a/bindings/python/gpiod/ext/line-config.c
+++ b/bindings/python/gpiod/ext/line-config.c
@@ -119,6 +119,10 @@ line_config_set_output_values(line_config_object *self, PyObject *args)
 		next = PyIter_Next(iter);
 		if (!next) {
 			Py_DECREF(iter);
+			if (PyErr_Occurred()) {
+				PyMem_Free(valbuf);
+				return NULL;
+			}
 			break;
 		}
 

-- 
2.47.3


