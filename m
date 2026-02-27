Return-Path: <linux-gpio+bounces-32261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b7zKIAddoWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:59:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E20971B4D47
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46E02301CC4B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 08:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF1A3D1CCD;
	Fri, 27 Feb 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4/1+DXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McKsJQfF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE983B52EB
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182746; cv=none; b=iiL/qOZvXrluvSflIh+VToxzxOVUI6KxuBRgVtKcQpLJ2Cb9vjXZ0jvsc3FykkPQYXJXKzFX4aQHElGTUFtbduH6xRVu6wjhxj4b4bFLzJVl29oMws6uW7pXa4bH5UBPLnVDyRgKQvNxq1xJ2aPSfjBBYNcAtkCB5ml8ej4KENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182746; c=relaxed/simple;
	bh=fB5UjQPpD+D9qZyDCB8SYs/gFWNRAvvueceaPw1cEQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxKfGfQnyrHfAxipO/zqg3Lw+D8OrIuNnBNZeY1JJZh+Ca2ZqlHbxGd0scD6Kfa2mvOVFdGxM1gLUo8Hen/jMNWtOxFUI0973ttiMB3oM4OJkGLgxSDXbyGB9JN8UqEY28QodUhEOwyKrY8ScHjt7R8cIWn4FCQfEYtbArlCito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4/1+DXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McKsJQfF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K02u1600697
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xa2xwKsAARO5/o99tsp0/G2WXxT4BDvg1rDv8++bkVk=; b=R4/1+DXQpBbCj2El
	llgdt2vPmQDBD8CFDy0MVKnkTd6eQXyKPPjuJVc6VvjxtX+SNfJ1XVcP96ZnlQIq
	C14W/xWsGKw1PkGbAG8UTQhqJXfuCdwWA345FOqCMniL/G0ZgxHgRWh7g7ltJ7Ot
	ouerbdN7CU70HTNcHDmT6yKgpIE9iYLS8kKU9hwoOnYI8ubZ0ZNvKrgvjy3mn2eV
	Uf7WgWvNaZx79bXOI0Hx7QYJNAwjcqsT5SBietDJzXJyahRuFdjXEUakcKDo+X0i
	sDIcqTa6/RKUILUhW93HBCN40FaiQaUrXHR2kF/uN+JHktF4fT9UZpmSF9jDA+ZJ
	fVHd+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99twb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2357575485a.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772182744; x=1772787544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa2xwKsAARO5/o99tsp0/G2WXxT4BDvg1rDv8++bkVk=;
        b=McKsJQfFRzwdYdk0gliF5886NV0vUETR/gE7cBiksuffU92VqYlo2dmwK8fYOl+n9+
         JTe7Bg/s9KvFJ9uTxPOowG47RApoih+z+9zf4IckYS2yh/KYvsbxrlv1A+0kf7IB5nqG
         6O/eIFO0TldSE2gUt5aUQRhc0shKQICnOs6gsPQjSKbAjkxIdeRu0HYQIEEaUPnDChLc
         A5CuwFxxeLl/1Rcc7QBX/13dV3z9iONXm3xlSqej+2YGYyknZBl8N6gcu/LT92POWogk
         3RIUsesT/nw9oJIu4S4xc83zYhT9RQ9Wz+lYLG3jIG/zLcfXMEQcpXv5rnA/h7GdX7VW
         atOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182744; x=1772787544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xa2xwKsAARO5/o99tsp0/G2WXxT4BDvg1rDv8++bkVk=;
        b=jHuDKqSwMJ2HB13VRbABkxt3mdMZZf8NX5BafWXLBR60j0GP8n/zB4UcP5vnXjSNzC
         au+VBn2VCPg9tX7yVerOaJ7xek/ZOBpam5obBbyQiILhjBMAX/mhQ5yCdmynPo2qm9Vz
         aPLNVjc8vfPUvCzUyVaXAJC/m3RopT9MS8gZih0JV2NsHOs5fLW9ui+N5bvun4UaPh/O
         7rjElm2zEwuH4sfwlXmbTpR6nXlAFmRc7U7RFvNJZ2+bmoAKSavx3a7YpH3cP9SC6X81
         /7SVxUPTpXBhPXCS7lEsJP1ssI5PlDz051nFdZzfpRDiaEOB5nUpAz1AIV39TDDDL+F5
         t1MA==
X-Forwarded-Encrypted: i=1; AJvYcCUrBkG3U6199jjqKsXkr0t4KTXVFlOU4KOpzUKMxCjUDl8Dhvt17ICLapMIZF+r3f8DAgHbemAu/I/w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6V1JWdjzXRnQlSAGehc2EBY9xrYlaSBXKb3T9AZ96D2dmhQRi
	dsIPjtmhQ7dolQhFIqkucx35mKu+sKKZK5VAxkqck/Bxst8szmjbt3pNRuP5QuqQ7Hrnz7/gnkE
	lbBteLva9gljhHTabaLkbQ6UNRZ8MSuB0M1XKJaN68FDULtCFnHscEEgO4xiarUpt
X-Gm-Gg: ATEYQzx4eWEY7iFKZWADQnCtTe1oXEqm419Ore+cgmn+5cfq/JVOeGPdv4DrXNUGkvM
	X8hGYW+3SEV1ro3wEZd8yCGjPi+7E8iBKcJG8jEm3HcpepmwV5012JCZGMgz1ussQmO9nfwQPcu
	65qjksinSTxJwldu8QBkcZpClTMegIHF5TywJ8ptdL7yzKNCWtWBapJUmMQxaS8LuhKj6OZ63nD
	v8hBdxhpsFTac3JzT9bXlMg5MO616vxBydaBxfxb7JlNlndL8BD6ALLeNon5JsVFMetLYx4be03
	wjR4HBCHENOr3sR14uyDflZcAzGp7n7nLEE7IFQK3z0II39ll6HQ/YmE5PZwgee1X0jKimqJFhO
	TIXGQPOFdFJg2NFYd7M/PbfemaZtDNZ1dIx/5/c237IZ0CYvNL4A=
X-Received: by 2002:a05:620a:1726:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cbc8d9d7d0mr259515685a.34.1772182744203;
        Fri, 27 Feb 2026 00:59:04 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cbc8d9d7d0mr259512585a.34.1772182743777;
        Fri, 27 Feb 2026 00:59:03 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm224129855e9.5.2026.02.27.00.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:59:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4] gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
Date: Fri, 27 Feb 2026 09:58:57 +0100
Message-ID: <177218264423.8055.13971416115087410858.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226-device-match-secondary-fwnode-v4-1-27bd0cfbd8c6@oss.qualcomm.com>
References: <20260226-device-match-secondary-fwnode-v4-1-27bd0cfbd8c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a15cd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=riAGlF5WBYjY1qQTpiUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eicf3sfafLpV6IA0sfK4aMAhgtp2YkJA
X-Proofpoint-ORIG-GUID: eicf3sfafLpV6IA0sfK4aMAhgtp2YkJA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3NyBTYWx0ZWRfX8RRGGygdI7Ky
 ivJ6+/TdqTRX0wnKAJ13w/913+uZo0hwqSMhKRtw6Z1bOsjqsh++seFG8gnLpoUGoFbgM+Fe4gv
 YUZKjGcqD7COKEDSFQwShOJFRS06Kd7Z4YgQL+16EqGUQ/nfs0IgUrh6dinDugtPlxHIYy3r5Uh
 kW9DQ0CMhLjUyL2gIazMDGM/2jhF+yUQ+2qZtNAnOIn1Hk73CH3pVsHlGB3N6r5U3+UC8HHbZPz
 Zs2OVsKUaGX1VzjyNw178ASVQihypZbEaGhAqjdRhOKpGyEF9Df5/jz33MrNGfw1P2mh9MpwKhx
 VJEa/stnN68YagJMni3c5vwUA+YPpJLAFYH39/Zk3EOt+tJ3KChYTy0dGYFFRgtumP/cYYLgi07
 vaU6lWKXV7quUq86QIt4SnEBJTZ6jczJZOwTONrvGgBgD7dyozoXR30irp870/3baCQZ684Gbob
 alzaomAFFwPs4+ToYUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32261-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,linux.intel.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: E20971B4D47
X-Rspamd-Action: no action


On Thu, 26 Feb 2026 10:56:36 +0100, Bartosz Golaszewski wrote:
> In GPIOLIB, during fwnode lookup, after having resolved the consumer's
> reference to a specific fwnode, we only match it against the primary
> node of the controllers. Let's extend that to also the secondary node by
> reworking gpio_chip_match_by_fwnode()
> 
> 

Applied, thanks!

[1/1] gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
      https://git.kernel.org/brgl/c/eb58f2b9bb0909ebce64e1a90b21b5cc2c9f17df

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

