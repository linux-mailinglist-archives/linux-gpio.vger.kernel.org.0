Return-Path: <linux-gpio+bounces-36086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PTPCxXc+GnG2QIAu9opvQ
	(envelope-from <linux-gpio+bounces-36086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 19:49:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F04C2255
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 19:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5643054F5B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 17:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8056B3E5EC3;
	Mon,  4 May 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCWb9pcj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E33E4C9A
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916890; cv=pass; b=Ge2JKfqrPcqdMBGC3iA6LtUdQ86nOD7vQH208s6RqqyrEmGWmD7Q72KlN64jGDSAM8HE/+4tEPGeo0O3ZUKTXB6Q9EzhfwUbXv5LrwfqJCmRN7V2xUnnZltOU+rJ7jZifwIqbVIpMEU6p/mQnw1w1PrPrbmxHewZEj04nlp9+DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916890; c=relaxed/simple;
	bh=LOurRDHjSai2G2rbWIw2gPwa7VKZi1IIioXo46dazEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKRzywAjg+ORg6DdOPpFu34ZvqP0DihqP1MNhJFQ6V4HFEgkd8PeQTHeN40zucCU5J/DlsxHe18/J0GpgCwV2SppA7iqzRGZRaSIslHW4duQbk4cv+7d/6Jgm5rmQmXFs+lJCmrsBZdm7sPOS9/y15OBA3ncFrY2scl8SljR9aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCWb9pcj; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bd4c61765dso47511797b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777916887; cv=none;
        d=google.com; s=arc-20240605;
        b=jVyDQF+ghC+mpMSQKKKaGYa5lnz6Btejic0awYOhouUycWOXKhrskF2dSyZlftvecx
         6ATnMZeJE8LrtDNjuxV4aeqafPb2/JOWOSTIjKQMre4SyWPu4vjByQl9yWCdhx13GpUN
         7Om85BoGRPVKAVA50nxlfcnpnA4fvbILYvwM++UeS/OMaQ58eTio6h7AAJm5PWeWQa+n
         pGlxFAGg3L9sOJGhLC5MiWyqhzOWZkUDaCQT+YI42kKsLv25H+5rOkM/aJ0a1L6UpT9i
         aNwrk+KWNxn65acNLFbXI44NCggjqAlq26I1BkQkcXZVrTje32rKQxNV5sCQywxG/71I
         ZLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbwzJWLQVwQJpPHHsXOLRmBuQjDthZvD8R85MgvQoMg=;
        fh=lCdUrgspx37gSeZ2Dv8tS3h7I2EzvJnonNy3RcbqS74=;
        b=HhgbbZiFvLex5AgkfdTFS5WfWQfjpjc+VetF81Y8qSSJ/jn/SR5WARu+QHkN/lehgd
         48s7Anwkb9TtjwiteIFEf9X+7DdWQtje6R8mXTsdHAd3YqwY7uZXKQW4iSn1iAeRXISj
         0wv+/V9mhp5xRHGYNnVmGCw7NG9dC0SzLZalkt6NuPtdxERQbxYSsmoHdVGw815HGVYj
         v6eRw6DAqMpBvwOKaOC/Y2r+gctVyKHoQWjQS1Gi8S7s4UM8AsaGlP3iRha6rrICzedy
         e6iIZEC8xIeyRBP1ep/L9ckO5oWs7+3jdJmr8+rJXRvkUxdxgbsQe2b+fhtgMe0JHNz6
         x+ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916887; x=1778521687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbwzJWLQVwQJpPHHsXOLRmBuQjDthZvD8R85MgvQoMg=;
        b=QCWb9pcjh7uzDQHdlYdgnF0Dzw4B83i1kwRwEJvSCENDsBI9jBjjJyx/+E3h3qNo8J
         HN/G67vniF7Kb6I3zpqtqr8CwtNT222CyULOYW4EupzmkfDIXqrXOSUiH3Llr8OSLQZN
         qT+bm8ld3LI58OSFIvavQJjhoeUfEri8yYC7aJ4IiXG/MaMLKb7huTofoQJkx0KhSZoz
         V1oPUQbt9n9IsPU+LRGl3IKTFelfUA6yLRNIfgikS7D5Po2QCVgGlt+06zINzhUqUB/5
         gK58YygXz+b+jLUc1Hr1dGQ56uBEcwPVcOVLIgliBiSROFiff0CCVNscU2HgH91U9SeO
         s97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916887; x=1778521687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbwzJWLQVwQJpPHHsXOLRmBuQjDthZvD8R85MgvQoMg=;
        b=Yq7KP4XwSDFr0Tjryc2nenPNw8lFGmfBMv74h2BSTx06AEF3TUZqgOzUr4hxK270eZ
         epu/grf3FZSTDJZK51QoOP1R3bwa6Fvi4UTNKbYHQMa2+7jjz3tvQ1IeB3qVNN37kB8h
         lw5J2YGH+V+y7WuBnsMNuuYuEQoqBEDs6tn1KmLePXFYpv/skmFmxAOBa5wdvWzq+Smj
         3Jtc/uI2L5NTKqHwVVwgw0+DMZ4dF3lZ/MNgNlVlaDwZ6rINx3Zfz0oxBbRhf7KFYMJg
         qgsm9WpZfRdEuotBeVslHz2UNedHT3Owp8biy5XQ93hAkcTw6AzpzQXn0XySGrpBI5Ug
         OTqA==
X-Gm-Message-State: AOJu0YzA9QnVHCwdwuU/G8kUdx9g3S3n3syJQ4XnQfzlcSS2ypEM0/P2
	WQyHfG7B1Baj7xJ2cUNllq7IqzPeqtDqS5cl+QyulaAZBN3anAC5vtODKbfKh38y+2bqOWuaoGX
	hNIaylxPECw1X7pQosFqCk0sx9+Sv6UI=
X-Gm-Gg: AeBDiesSvLecbjZXplUCEx+m8vuCz836/gDDiGDNkj4ZbGK3fDXQWZT62r/6CGAUjCM
	SM8BKzItIBh4uvOSCCooJ9quOdi8BFbkasDB4kcOKcRUhiL9vjFEiz6hokOd3yXZNSuC9zTjEZo
	gPHu7VL7vtK0gfx5DjpS2cRr0msQoyNGihjT7slejbr+10hPeNnDNmhoi2t58Gnzvc9G/5aMW2Y
	IJhZ22pYwBwKfAMuu7fk3kul9FioRXGhckj2DTpkxRRRWRT7oHA3KRxtJTYrW2SY57kvd4ByJ8L
	9v7n6bHkIJssBSTgJ/FA
X-Received: by 2002:a05:690c:6e85:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7bd8752e640mr71520187b3.41.1777916887002; Mon, 04 May 2026
 10:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com> <20260504075036.12190-3-zxl434815272@gmail.com>
In-Reply-To: <20260504075036.12190-3-zxl434815272@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 12:47:55 -0500
X-Gm-Features: AVHnY4KjHKNg8iO7tvI0uPcJ2XwAfY5TXI27Yj2znkA6UsQPZHKanuBXSt7Brg4
Message-ID: <CAKqfh0GznF_QDr4S0KKk3c6HVfFhgEQQPO2_W6T=eTYVXnJe9Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tools: gpio: fix ioctl name in error message
To: Zhang Xiaolei <zxl434815272@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, warthog618@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7E9F04C2255
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36086-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Zhang,

On Mon, May 4, 2026 at 2:56=E2=80=AFAM Zhang Xiaolei <zxl434815272@gmail.co=
m> wrote:
>
> Use the correct ioctl name in the error message.
>
> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
> ---
>  tools/gpio/gpio-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
[snip]

Patch looks technically good but when I meant split these patches I
meant into entirely separate patches. Please split this away from the
patch series.

best regards,
max

