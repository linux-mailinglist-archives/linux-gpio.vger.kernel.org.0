Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E44463D10D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 09:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbiK3IuY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 03:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbiK3IuY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 03:50:24 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4856F2D1C0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 00:49:31 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n21so39593052ejb.9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 00:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zH8aSJxK3c7rIzvimOimoZ81OVEIXiVR3DkWunf1dVY=;
        b=SKx9ESLbDIM+R2PEQL44SkL15rgUxrVHEGlXGj7Sn0VUA+8S3+9xVhUkj6JkMT9o+x
         N7B2V0SJJ+i0thf2KIvvSoA0rrEeMTCcxMSXhouQMMnvRPBpB3eBulwKYN+0sqsjDIcf
         Qs4lfOD/5u22fzcokThwSlviaQnyNndMVptY7NcuZSYVYN6yiHY39Kc0dBLl0876uS6Q
         Wg4/VHnPvSsRD6BHknUKcIY37a1MMfceitauqH2tZIJzwdJJ5uYSF6Ev/JaeU5djOi12
         glEYaJ1WvEM++hkFpabx8Lfdqz8eNoVXLpPnKUb8pfgq2Cybsv3RRy/tP5rUfD1TI6ws
         NRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zH8aSJxK3c7rIzvimOimoZ81OVEIXiVR3DkWunf1dVY=;
        b=cskRyXvvugptrDFi0enHLXfDeJ32loCBfLGWGKzfchj7OWN8LEWeUSKT2GeZk8btz8
         fTQ080nh5OUARfskpCN1olnU/3EaBW8jozj8Mp0yOIvo0ZQ1foltryGIe2RM/Ie3ufvh
         XQ1xf8RBwGocQosI/lLbqvZ1XQ4XiuG2U5O46TISzFhExpR1U4+yobzOjIGdKOn/vmTT
         E/3PWoLfNFSr+AxjK+WuCdrnjqRj+cU2wkl27mm4fq/yMdbXUGAdA2BcFIZT01uuYBUN
         Kv5B/psBqLoEkNMoPxz5c97AgL+SVy3y81MRUyZyDI2snjYlHQQQy+PJ809nsInxGk69
         CtIA==
X-Gm-Message-State: ANoB5pmGEt+ZPm/LktdGeKCKLZc8t3wBlVrLEPHmjn7+LZ1TH2K/4cXX
        HhV+BFVA5XFRSmhx/yWhK+17mdwDoWw=
X-Google-Smtp-Source: AA0mqf5WaYrj7q6B250TjWYZ+CSEnmrtkJqolTl0sHpgRtNqip2jbKBeBxeJP1nL3wZ3leAcOd2jYw==
X-Received: by 2002:a17:906:4b04:b0:7b9:a75b:faf9 with SMTP id y4-20020a1709064b0400b007b9a75bfaf9mr30930145eju.473.1669798169775;
        Wed, 30 Nov 2022 00:49:29 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:866e:6400:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id kx16-20020a170907775000b007c0934db0e0sm390135ejc.141.2022.11.30.00.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 00:49:29 -0800 (PST)
Message-ID: <97b4bac2f0d703cd693707adfbfc08d55031b85f.camel@gmail.com>
Subject: Re: [PATCH v2] ARM: ep93xx: Convert to use descriptors for GPIO LEDs
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        H Hartley Sweeten <hsweeten@visionengravers.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Lukasz Majewski <lukma@denx.de>
Date:   Wed, 30 Nov 2022 09:49:28 +0100
In-Reply-To: <20220902220421.604516-1-linus.walleij@linaro.org>
References: <20220902220421.604516-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMhCgpPbiBTYXQsIDIwMjItMDktMDMgYXQgMDA6MDQgKzAyMDAsIExpbnVzIFdh
bGxlaWogd3JvdGU6Cj4gVGhpcyBjb252ZXJ0cyB0aGUgRVA5M3h4IHRvIHVzZSBHUElPIGRlc2Ny
aXB0b3JzIGZvciB0aGUKPiBMRURzLgo+IAo+IENjOiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPgo+IENjOiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVy
ZGxpbkBnbWFpbC5jb20+Cj4gQ2M6IEhhcnRsZXkgU3dlZXRlbiA8aHN3ZWV0ZW5AdmlzaW9uZW5n
cmF2ZXJzLmNvbT4KPiBDYzogTHVrYXN6IE1hamV3c2tpIDxsdWttYUBkZW54LmRlPgo+IFNpZ25l
ZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkkndmUg
dGVzdGVkIGl0IG9uIEVEQjkzMDItc2ltaWxhciBjdXN0b20gYm9hcmQsIGJvdGggTEVEcwp3b3Jr
IG5pY2VseS4KClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRs
aW5AZ21haWwuY29tPgoKPiAtLS0KPiBDaGFuZ2VMb2cgdjEtPnYyOgo+IC0gRml4IHN5bnRheCBl
cnJvciAoZG91YmxlZCBsZWZ0IHBhcmVucykKPiAtLS0KPiDCoGFyY2gvYXJtL21hY2gtZXA5M3h4
L2NvcmUuYyB8IDEzICsrKysrKysrKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWVw
OTN4eC9jb3JlLmMgYi9hcmNoL2FybS9tYWNoLWVwOTN4eC9jb3JlLmMKPiBpbmRleCAyZDU4ZTI3
M2M5NmQuLjMxOGMwOWVlNDcyMyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLWVwOTN4eC9j
b3JlLmMKPiArKysgYi9hcmNoL2FybS9tYWNoLWVwOTN4eC9jb3JlLmMKPiBAQCAtNDI1LDEwICs0
MjUsOCBAQCB2b2lkIF9faW5pdCBlcDkzeHhfcmVnaXN0ZXJfc3BpKHN0cnVjdCBlcDkzeHhfc3Bp
X2luZm8gKmluZm8sCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGdwaW9fbGVkIGVwOTN4eF9sZWRf
cGluc1tdIF9faW5pdGNvbnN0ID0gewo+IMKgwqDCoMKgwqDCoMKgwqB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAubmFtZcKgwqDCoD0gInBsYXRmb3JtOmdybGVkIiwKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmdwaW/CoMKgwqA9IEVQOTNYWF9HUElPX0xJTkVf
R1JMRUQsCj4gwqDCoMKgwqDCoMKgwqDCoH0sIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC5uYW1lwqDCoMKgPSAicGxhdGZvcm06cmRsZWQiLAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAuZ3Bpb8KgwqDCoD0gRVA5M1hYX0dQSU9fTElORV9SRExFRCwKPiDCoMKg
wqDCoMKgwqDCoMKgfSwKPiDCoH07Cj4gwqAKPiBAQCAtNDM3LDYgKzQzNSwxNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGdwaW9fbGVkX3BsYXRmb3JtX2RhdGEgZXA5M3h4X2xlZF9kYXRhIF9faW5p
dGNvbnN0ID0gewo+IMKgwqDCoMKgwqDCoMKgwqAubGVkc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqA9
IGVwOTN4eF9sZWRfcGlucywKPiDCoH07Cj4gwqAKPiArc3RhdGljIHN0cnVjdCBncGlvZF9sb29r
dXBfdGFibGUgZXA5M3h4X2xlZHNfZ3Bpb190YWJsZSA9IHsKPiArwqDCoMKgwqDCoMKgwqAuZGV2
X2lkID0gImxlZHMtZ3BpbyIsCj4gK8KgwqDCoMKgwqDCoMKgLnRhYmxlID0gewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBVc2UgbG9jYWwgb2Zmc2V0cyBvbiBncGlvY2hpcC9w
b3J0ICJFIiAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHUElPX0xPT0tVUF9J
RFgoIkUiLCAwLCBOVUxMLCAwLCBHUElPX0FDVElWRV9ISUdIKSwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgR1BJT19MT09LVVBfSURYKCJFIiwgMSzCoE5VTEwsIDEsIEdQSU9fQUNU
SVZFX0hJR0gpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7IH0KPiArwqDCoMKg
wqDCoMKgwqB9LAo+ICt9Owo+ICsKPiDCoC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gwqAgKiBFUDkzeHgg
cHdtIHBlcmlwaGVyYWwgaGFuZGxpbmcKPiDCoCAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+IEBAIC05ODks
NiArOTk3LDcgQEAgc3RydWN0IGRldmljZSBfX2luaXQgKmVwOTN4eF9pbml0X2RldmljZXModm9p
ZCkKPiDCoMKgwqDCoMKgwqDCoMKgcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyKCZlcDkzeHhfb2hj
aV9kZXZpY2UpOwo+IMKgwqDCoMKgwqDCoMKgwqBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXIoJmVw
OTN4eF93ZHRfZGV2aWNlKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGdwaW9kX2FkZF9sb29rdXBf
dGFibGUoJmVwOTN4eF9sZWRzX2dwaW9fdGFibGUpOwo+IMKgwqDCoMKgwqDCoMKgwqBncGlvX2xl
ZF9yZWdpc3Rlcl9kZXZpY2UoLTEsICZlcDkzeHhfbGVkX2RhdGEpOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiBwYXJlbnQ7CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoK

