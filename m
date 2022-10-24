Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D5360B883
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 21:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiJXTuc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 15:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbiJXTty (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 15:49:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB60816654B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 11:15:49 -0700 (PDT)
Received: from [IPv6:2a00:23c6:c311:3401:ea41:bd36:d345:43f7] (unknown [IPv6:2a00:23c6:c311:3401:ea41:bd36:d345:43f7])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: martyn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EA9526602837;
        Mon, 24 Oct 2022 17:58:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666630714;
        bh=TmaJQU/H+IYtMX5/u8K9L8R5I0m5YM2R2iIEKpOoQ7Q=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=W8dQ8gmruW+xjm72ILyYK7qlMMMuoE54SwWVnzJFLLjf/K+EoYNrOwVdn9G8d0M0U
         x5HsDQQlHPcXDOSB2F8A4YGmOrPgIVnGQg7Elx4XyfrugQN61pATItS0CVvvuvt+FP
         lDz3OHGTqn/5kNs49gHCrlDum8TzwX9JDZSOPrWCnMz6LYuTKMgt3oBq+v1EfaV0E7
         QIHSLUtMhz7UX9QNntu1Gx0ikxqBf9tpIOkpxqcdD49qwgxkmc0nTg8T3hUoxlJBPH
         4FzTfzTDBQ/3y4KJX3Kn+peLNSZIiH/1JBiYgCJhIBR8O77w35Q36idvpAYoBwOBtx
         9Nb+6K7dD99dQ==
Message-ID: <28271fb33b5b48117e2b79c675b4c186c9bf7304.camel@collabora.com>
Subject: Re: [PATCH 1/2] gpio: pca953x: Generalize interrupt mask register
 handling
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Levente =?ISO-8859-1?Q?R=E9v=E9sz?= <levente.revesz@eilabs.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Date:   Mon, 24 Oct 2022 17:58:31 +0100
In-Reply-To: <20221010132007.924810-2-levente.revesz@eilabs.com>
References: <20221010132007.924810-1-levente.revesz@eilabs.com>
         <20221010132007.924810-2-levente.revesz@eilabs.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.0-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIyLTEwLTEwIGF0IDE1OjIwICswMjAwLCBMZXZlbnRlIFLDqXbDqXN6IHdyb3Rl
Ogo+IEBAIC0xMjQ1LDIxICsxMjY1LDIzIEBAIHN0YXRpYyBpbnQgcGNhOTUzeF9yZWdjYWNoZV9z
eW5jKHN0cnVjdAo+IGRldmljZSAqZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoCNp
ZmRlZiBDT05GSUdfR1BJT19QQ0E5NTNYX0lSUQo+IC3CoMKgwqDCoMKgwqDCoGlmIChjaGlwLT5k
cml2ZXJfZGF0YSAmIFBDQV9QQ0FMKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJlZ2FkZHIgPSBjaGlwLT5yZWNhbGNfYWRkcihjaGlwLCBQQ0FMOTUzWF9JTl9MQVRDSCwKPiAw
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoY2hpcC0+ZHJpdmVyX2RhdGEgJiBQQ0FfSEFTX0lOVF9N
QVNLKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ2FkZHIgPSBwY2E5NTN4
X3JlY2FsY19hZGRyKGNoaXAsIGNoaXAtPnJlZ3MtCj4gPmludF9tYXNrLCAwKTsKCkZvciBjb25z
aXN0ZW5jeSwgdGhpcyBzaG91bGQgcHJvYmFibHkgY29udGludWUgdXNpbmfCoApjaGlwLT5yZWNh
bGNfYWRkcigpLgoKTWFydHluCgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
ID0gcmVnY2FjaGVfc3luY19yZWdpb24oY2hpcC0+cmVnbWFwLCByZWdhZGRyLAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWdhZGRyICsgTkJBTksoY2hpcCkgLQo+IDEpOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc3lu
YyBJTlQgbGF0Y2gKPiByZWdpc3RlcnM6ICVkXG4iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc3luYyBJTlQg
bWFzawo+IHJlZ2lzdGVyczogJWRcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnYWRkciA9IGNoaXAtPnJlY2FsY19hZGRyKGNoaXAs
IFBDQUw5NTNYX0lOVF9NQVNLLAo+IDApOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChjaGlwLT5kcml2
ZXJfZGF0YSAmIFBDQV9QQ0FMKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
Z2FkZHIgPSBjaGlwLT5yZWNhbGNfYWRkcihjaGlwLCBQQ0FMOTUzWF9JTl9MQVRDSCwKPiAwKTsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ2NhY2hlX3N5bmNfcmVn
aW9uKGNoaXAtPnJlZ21hcCwgcmVnYWRkciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVnYWRkciArIE5CQU5LKGNoaXApIC0KPiAxKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmIChyZXQpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHN5bmMgSU5UIG1hc2sKPiByZWdpc3Rl
cnM6ICVkXG4iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc3luYyBJTlQgbGF0Y2gKPiByZWdpc3RlcnM6ICVk
XG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Cgo=

