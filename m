Return-Path: <linux-gpio+bounces-37790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN3WLRuLHmrjkwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:49:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D029629EAB
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C76AE313FFB2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911AC3B6C0C;
	Tue,  2 Jun 2026 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAzaUDla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdZgNkjA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054C3B8BBB
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385877; cv=none; b=HZ9c3y6FkSC+mIr0RNPW/MIy1LQRdXrPiLcX2MfB4DUetnf3/z+E/V2Y9OxL8Wr+b28zbjFdTyRMBUD5bAmwmEBhE6yH9y3MRz+o9qhehQRXdef5TT1LIGo6ae4PVXKXsszHxwdnpXoqG0kzEQRe7yJdxcQBKcWQhQX1Hoduwio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385877; c=relaxed/simple;
	bh=tV+8wbXORE/Gog4Pk9M7ku8Sh1aer2iGDTenW7xZQ7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTr0hREy7MUkzyDhNXiF5TogSm0wyZ65uPUi9fAGEiLf8x3yfTI3jKDo3b30+wsdHZJZ1ZRDlLqFZhDqnnFS0nMfnth7bBevhyfSBZE2svO8hz+KIml/InNXXkUCydD4/Srn89Q3CaGLPGJK9bmv+3Z3fyjg+pokiTBDxwwPZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAzaUDla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdZgNkjA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6523VjFw599934
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5bNRPKhku6wDxOHoZkXGW3iXGgCW1s0EG5PKe71h8o=; b=HAzaUDlaf/rLnrIF
	EJ0arDvtFJxR8dYbb7DTu5TbLe/MIYW8VMqNnbiB4+oh3+ugex/bsLb1yPDaJtYS
	fDbm0cNbtrJVrxH4mF2bWcQ8qvIfiNN+Be8V0rl+W05yaI777zfLak3JqdqZv6GO
	QubWAuQrMagf1fqTzpvD6nhHYhK1AuCCC3UfpUrU8YMQRNGjsmoQZfsyeN6x1ovH
	ZOxG8jk7+gywO7dMz14ScX8xRBkILwBjf8J4dJau1syfJjX0M/dQ9cm7B/519avx
	n1DjcE9WlZudzk+T/7CnFWwjQ7zkEOkv2s6BrKELq+sx51aYjMII8q5P6JpIK63I
	CA7PSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8rccxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176d5d7222so5611721cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385872; x=1780990672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5bNRPKhku6wDxOHoZkXGW3iXGgCW1s0EG5PKe71h8o=;
        b=OdZgNkjAndNgPqno+FcG1e2KDBKrAzUYDGSne3rk5SaDfOGeS0LDrDVVpYkw7voStH
         KefyMU3N1ZYMUekCbNL+JHulCr4FG4kZCz9SVUaPGACHOEFcLro+Pv7+6cC3hCiO9TeZ
         v+p30WwNG7OJyribkhB5ObzClXRP9T6VRhpR16OH4BTv0Q1CeRjyyawwiu8H+25sZK7M
         Jl/uyDQkvdXE6PxzXN4sYkWeVcAUfdx8Hh3wexxtokk/jItjpOVBdAbzwAlR00Mqg/ST
         iBq17TQLuJQNYVaNZYh0DiQpzO4nnmMemW0pB96eIhd09o9IsWFww9i5qfG3wu44x8zx
         YFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385872; x=1780990672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5bNRPKhku6wDxOHoZkXGW3iXGgCW1s0EG5PKe71h8o=;
        b=WMdsW553IrHN1aZ3nnRrTw5FcQuY1yfeqYRSEVrWduCOT18Ncg8tA3nh0U6c6FLVr5
         r+ixoERMMEkDhhPhNywpSAVOelSNZumFDkSKRUEIS7QjPX20AJ3mhJt2gfvv19NJMUzT
         OdmPyMJkxEOVLdZSk1J/C6HUg1h8AEo/81FvFwrmfRtUddjAJZhxR05QfSdNWgH3lujn
         fZyeQDtZqTzeO22hi21lwUdty4QpJ+QVaG2urjfPodnxVmg5LWxIiuwtzFliEs5UEc0T
         Mo+HuTC8o03+7Dn72u3spbSyQfnFc2UBUK4EuipTtbTiwowxp/wgJsMa15cng7kjlWTZ
         B/cA==
X-Forwarded-Encrypted: i=1; AFNElJ+pJgEV1ZohKSszMPySScbtz0Wigx4wti4rDc/WObJ8cpi6/5wXgQP45ibbkSRMdZmp5i9zO3fCu03P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu9FzxmHCQAdGC3lY/SQ23asklbf046s/nBGfnv5KDCHq/z5XB
	ap2pOCNRO82gETsXb0ERSscdpVVhD3IAz5Zso3GPBl7Q7nIqCXXSIf/W7VbjkS6okV9QZqO4NM2
	D6/Fona3qoELLkCu/65lohtkQMqp+MpzhPIKuvnXbAQt/0OmrbatAQ7WkXZr4i41x6yltvMmo
X-Gm-Gg: Acq92OHU8xE1QZsouGpMM7uu1DHVdm0MF1kFAWzx4OSAsBAdMjgyRcVdSn+bXswQvJV
	UdmkwM8aXyB/JKBH5wD9bali6hC+LX7VvGIl7m8Yy6N+t8tiiwCjVrxKdAtxyVoRX+Oi/70U9Xp
	CNM8FyHQeGU1xTmI05AiRYR/VpQrr+gFweU6/pgJvnkwEDqHWvE3oHH6DWmXHATWeNanHa50nju
	vcwswwQPTKqCFfZmqMK9Q6r2IjeO2kzeCGaheIKnO6ngpFqhyjRcHcG0yQfw7+JnbY08rtz8yv7
	ZDo/5vOW8zhtM72HF9m0Yi0JyQdqStuKfqw1c7MsvNUlEK8xzRz5RWosOnUa7TJ4QkqOoOI0I+u
	T5lu2XPGL1cI2RX/PI3X1s2w5cv53Zg3BiAmmGBFVfxANqYWG7Upt5Rg9Xowm/QLDm/TiaJrEiC
	QdvChjPz5V9s45Dw==
X-Received: by 2002:a05:622a:2308:b0:516:e033:f599 with SMTP id d75a77b69052e-5173a8e84cemr195936791cf.60.1780385871551;
        Tue, 02 Jun 2026 00:37:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2308:b0:516:e033:f599 with SMTP id d75a77b69052e-5173a8e84cemr195936591cf.60.1780385871063;
        Tue, 02 Jun 2026 00:37:51 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:20 +0200
Subject: [PATCH 9/9] bindings: rust: implement Eq and Ord for chip::Info
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-9-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tV+8wbXORE/Gog4Pk9M7ku8Sh1aer2iGDTenW7xZQ7k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog/vyWt2gip5azHCpoRHmDYzJLXDwJdsowQy
 hXMIRgNDy+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IPwAKCRAFnS7L/zaE
 w/OzD/92BPwwO5LHcYCAUUSk+aBS7/voAWSqM8UcARJDiOIHx0BbtNuZek0vBX1vF7eUqSGqTa4
 O4Eq3ppHJpQfLW1JtAB9YbR7dwrhMZ7LsaF/Pw54M53uay+E0SQAFIwXU5WoRCj+WtBp2dTVa6f
 jB30jY6Cr7Vzchw8x4z9kQCms2+iHN+09y4bIUhwfjm4tkZGlJM3gwM5ow8ilEvXH1ztB79g1Vi
 3Jp3xBKx2riAGmh+wmBklMCDKpN2u7m6ieevS+XNMm3+644vKgbMIzsCBRDsGAtbYx8kWhmOTwv
 q6niqJdRAR5uxza9EcLNgXXeNcHY5FG2fhTrsJ/iLcilJzIPk/z4B502Gn+VjXKGo4hKePcN0Ok
 kn00JdVbL6nAx6Sx3PoS1BTIe3RgjcnR006PrwY2EOmCcAnTReF9IAxwQo0KkmbistbML3rHhXt
 2qfEw5rUKKhcb7pYNR2hB0kz7DAAySx5HXDf9M4ZIrgGPvry2q5G7sSFcRSQ+ryUEF6DCySNCgd
 fe1LBGVhTOrvjb2bl9B2QhiA8LaDCo8EVYaDnMDgFGdyje2uQKyzxLgMosKmRhOlSkYGo7o73ds
 QrVugI9ydmmYokLaddjSa3Z+DK7wv+6XfNyborgcdUMNt06aVq6sdZGovmri6A9Wi3Y8RMAZ0RN
 44rGiPDXFLADXqQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1e8850 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pkKejVImPdrJaLrAb2AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YPX_2hoSYLywnPlgmADflsrMQGgODvaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX4McTrsbHaU0V
 9cvbrR++9UlsTCqsy/QYi1QujtxwehCoXwpLYTrALLvX9KO51FGOzskSQKUahQ8ow8Epa//tgl+
 ggaRhKQ3e3gMuu4EudLIIQp6BmJ6ZV34E1Eln3QW5Of9EdUSJTK8aLsFuIAw7BtGyUejCukKZ0V
 UrC20FZTJvGJCHYLjrTzXVVNFOGE10Pl/Z2YV5Q59+YpnuFMQcnV8CVnVVAU6OsyQGJYM14+3L8
 OHjSrX2J/e2Zh+PdTnnmOtSLaKjC2x0FhzeT3sdMPF8dwOSA6nZx9mbPPL445bJ9Od/Qb90Db3j
 CRdQckduQUceUl0vJOYJBoUE0zm+SGg19ZYGx0LRh6p06Vgf5khp/+zIrpi91TfxHULeVOVPeOx
 dZwVsAEEia68WUTnB+yCHGpCbGPQSEJ1maIVWtk7DP3sKkNiCMbXgxZOPfgB1HUujN8tIvYjozn
 sWpaJ8qhJj9KWSX45Cg==
X-Proofpoint-ORIG-GUID: YPX_2hoSYLywnPlgmADflsrMQGgODvaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37790-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
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
X-Rspamd-Queue-Id: 1D029629EAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

chip::Info already implements PartialEq and PartialOrd (both based on
comparing chip names as UTF-8 strings), but not their total-order
counterparts Eq and Ord. The omission is inconsistent: types with a
total order should implement Ord so callers can use the ergonomic sort()
/ min() / max() APIs.

Add the missing impls. Ord::cmp() delegates to partial_cmp() and falls
back to Ordering::Equal for the unreachable case where a chip name is
not valid UTF-8. Update gpiochip_devices() to use cmp() directly now
that Ord is available.

Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/rust/libgpiod/src/chip.rs | 6 ++++++
 bindings/rust/libgpiod/src/lib.rs  | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 1e98cb28efe97d7cd97363a62cd5b2b346cf381a..22b4eeaea5a2731dfb1a56041d4be89103e29896 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -282,6 +282,12 @@ impl PartialEq for Info {
     }
 }
 
+impl Ord for Info {
+    fn cmp(&self, other: &Self) -> Ordering {
+        self.partial_cmp(other).unwrap_or(Ordering::Equal)
+    }
+}
+
 impl PartialOrd for Info {
     fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
         let name = match self.name() {
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 22a3b87975318713d0fffd5a3e4fed214e984044..fa6fb0d0f65b1cd3fec710e8c8832fc010695b7c 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -12,7 +12,6 @@
 //! The API is logically split into several parts such as: GPIO chip & line
 //! operators, GPIO events handling etc.
 
-use std::cmp::Ordering;
 use std::ffi::CStr;
 use std::fs;
 use std::os::raw::c_char;
@@ -492,7 +491,7 @@ pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
         }
     }
 
-    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap_or(Ordering::Equal));
+    devices.sort_by(|a, b| a.1.cmp(&b.1));
     devices.dedup_by(|a, b| a.1.eq(&b.1));
 
     Ok(devices.into_iter().map(|a| a.0).collect())

-- 
2.47.3


