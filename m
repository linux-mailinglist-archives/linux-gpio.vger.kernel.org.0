Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2C6476C48
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 09:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbhLPI4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 03:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhLPI4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 03:56:41 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FA9C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 00:56:41 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id q25so35684638oiw.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 00:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=cFmvySqmZ9b4K05YuMcJpfFm2sy3ssgk8mRS8y6zftw=;
        b=jApZYCeUEKqOfiAvp6IIrcdzUo+Rox7+kTWjngmaCZDYAkqOsj6j4h0iSrllhmz0rC
         cOyfrXt3BaX1mys+KFIMus7sI1O1QqAEyBfFDNv9owyNGPaZG1+7avSr2ecAX0dd6C9v
         3bD5ZiL1c6qoZp5qIrDV1gjNupz5Rj9MkBqq9aU8K/yONlMzVXt7gVb1fu6xLIqWEs/5
         feyHilJfRG1dJHpO/IPFNFrGAumbOV8bSOe3CHJnYezM7l+z4qJnESzx/5zfjiZZyUhP
         n9ziS1Isf32jCKRklPcloR2NwgR+MZx/eg44djnCSfJz0vdNv+d3ixxFSZmYOf50uEuz
         SgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=cFmvySqmZ9b4K05YuMcJpfFm2sy3ssgk8mRS8y6zftw=;
        b=ehhmGTZoOjd6/VUNUmp5LZDiVFVK4J2eJfBexwZl+Jd51ORZRo5dzTXm6rWx+/+n07
         t9ztRn1o8sJlaMd7kEKmGHcg3nhryv9h8c/x+wnpkJIEzCMjsCqCqBUUz/5lzdS21tkl
         Z5Q4IRlrj8RQ/sNq6eMwlQCB2+kHe4JEapI1mhSJ+ItMbB/vTvMVLEtPXnrWiLMKmx0Q
         lhFE1JRKrNcWc3IaQq+Sji58gq0PC5uZysYE0fBOK+ByY+7fNntW2YAyQiB7t4SSmCa1
         lnkj7mH6cAElJ2BQ03dS+ifucDQUKV8U4N8Eilkk9BHQ55wvOFPV1XR38LGsrS39LzyZ
         QwdA==
X-Gm-Message-State: AOAM5316VWO/46JqaKvNpI63VKCu3MZye2G8RgxlvBk7Qu+0/IpAU5Jg
        jmut32+91dsCJWju657vp0WkguafrsQlV6f5gevtoo/bB5c=
X-Google-Smtp-Source: ABdhPJzw2LfCRzOHzKkPF3bqQNuWrJnz2nDaNFtb0W1pqgdoaJ7mBnWFfHlcVBnph19ZdAm5gLbm2RVlkAQazdurv/E=
X-Received: by 2002:a05:6808:f87:: with SMTP id o7mr3336913oiw.122.1639645000028;
 Thu, 16 Dec 2021 00:56:40 -0800 (PST)
MIME-Version: 1.0
From:   Gerard Ryan <g.m0n3y.2503@gmail.com>
Date:   Thu, 16 Dec 2021 18:56:28 +1000
Message-ID: <CAKycSdDMxfto6oTqt06TbJxXY=S7p_gtEXWDQv8mz0d9zt3Gvw@mail.gmail.com>
Subject: [libgpiod] Generated Rust lang bindings
To:     linux-gpio@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000c8ef4305d33f994b"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--000000000000c8ef4305d33f994b
Content-Type: text/plain; charset="UTF-8"

Hello,
I created a build script to generate rust sys/unsafe bindings to build
safe bindings upon.
I have not reserved the `libgpiod-sys` or `libgpiod` crate names on
crates.io as I figured it'd be easier for someone here to manage the
credentials for that.
Also, I'm not sure when I'll get time to work on the safe bindings
(`libgpiod`) but figured this would be a good starting point.
As for licensing, I couldn't find any agreements or preferred
licensing for submissions so I submit this under a tentative MIT
license.

Kind Regards,

Gerard

```
MIT License

Copyright (c) 2021 Gerard Ryan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

```
From 25d8abe9997747491d4e4178efaec116b811f690 Mon Sep 17 00:00:00 2001
From: Gerard Ryan <G.M0N3Y.2503@gmail.com>
Date: Sat, 6 Nov 2021 21:23:01 +1000
Subject: [PATCH 1/2] Added libgpiod FFI bindings generation crate

Signed-off-by: Gerard Ryan <G.M0N3Y.2503@gmail.com>
---
 bindings/rust/.gitignore              |   1 +
 bindings/rust/Cargo.lock              | 382 ++++++++++++++++++++++++++
 bindings/rust/Cargo.toml              |   2 +
 bindings/rust/libgpiod-sys/Cargo.toml |  14 +
 bindings/rust/libgpiod-sys/README.md  |   7 +
 bindings/rust/libgpiod-sys/build.rs   | 166 +++++++++++
 6 files changed, 572 insertions(+)
 create mode 100644 bindings/rust/.gitignore
 create mode 100644 bindings/rust/Cargo.lock
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/README.md
 create mode 100644 bindings/rust/libgpiod-sys/build.rs

diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
new file mode 100644
index 0000000..2f7896d
--- /dev/null
+++ b/bindings/rust/.gitignore
@@ -0,0 +1 @@
+target/
diff --git a/bindings/rust/Cargo.lock b/bindings/rust/Cargo.lock
new file mode 100644
index 0000000..0243b1b
--- /dev/null
+++ b/bindings/rust/Cargo.lock
@@ -0,0 +1,382 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 3
+
+[[package]]
+name = "aho-corasick"
+version = "0.7.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7404febffaa47dac81aa44dba71523c9d069b1bdc50a77db41195149e17f68e5"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "ansi_term"
+version = "0.11.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b"
+dependencies = [
+ "winapi",
+]
+
+[[package]]
+name = "atty"
+version = "0.2.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
+dependencies = [
+ "hermit-abi",
+ "libc",
+ "winapi",
+]
+
+[[package]]
+name = "bindgen"
+version = "0.59.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "453c49e5950bb0eb63bb3df640e31618846c89d5b7faa54040d76e98e0134375"
+dependencies = [
+ "bitflags",
+ "cexpr",
+ "clang-sys",
+ "clap",
+ "env_logger",
+ "lazy_static",
+ "lazycell",
+ "log",
+ "peeking_take_while",
+ "proc-macro2",
+ "quote",
+ "regex",
+ "rustc-hash",
+ "shlex",
+ "which",
+]
+
+[[package]]
+name = "bitflags"
+version = "1.3.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+
+[[package]]
+name = "bitvec"
+version = "0.19.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8942c8d352ae1838c9dda0b0ca2ab657696ef2232a20147cf1b30ae1a9cb4321"
+dependencies = [
+ "funty",
+ "radium",
+ "tap",
+ "wyz",
+]
+
+[[package]]
+name = "cexpr"
+version = "0.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "db507a7679252d2276ed0dd8113c6875ec56d3089f9225b2b42c30cc1f8e5c89"
+dependencies = [
+ "nom",
+]
+
+[[package]]
+name = "cfg-if"
+version = "1.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+
+[[package]]
+name = "clang-sys"
+version = "1.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fa66045b9cb23c2e9c1520732030608b02ee07e5cfaa5a521ec15ded7fa24c90"
+dependencies = [
+ "glob",
+ "libc",
+ "libloading",
+]
+
+[[package]]
+name = "clap"
+version = "2.33.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "37e58ac78573c40708d45522f0d80fa2f01cc4f9b4e2bf749807255454312002"
+dependencies = [
+ "ansi_term",
+ "atty",
+ "bitflags",
+ "strsim",
+ "textwrap",
+ "unicode-width",
+ "vec_map",
+]
+
+[[package]]
+name = "env_logger"
+version = "0.8.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
+dependencies = [
+ "atty",
+ "humantime",
+ "log",
+ "regex",
+ "termcolor",
+]
+
+[[package]]
+name = "funty"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fed34cd105917e91daa4da6b3728c47b068749d6a62c59811f06ed2ac71d9da7"
+
+[[package]]
+name = "glob"
+version = "0.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b919933a397b79c37e33b77bb2aa3dc8eb6e165ad809e58ff75bc7db2e34574"
+
+[[package]]
+name = "hermit-abi"
+version = "0.1.19"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "humantime"
+version = "2.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+
+[[package]]
+name = "lazy_static"
+version = "1.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+
+[[package]]
+name = "lazycell"
+version = "1.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
+
+[[package]]
+name = "libc"
+version = "0.2.106"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a60553f9a9e039a333b4e9b20573b9e9b9c0bb3a11e201ccc48ef4283456d673"
+
+[[package]]
+name = "libgpiod-sys"
+version = "0.1.0"
+dependencies = [
+ "bindgen",
+ "pkg-config",
+]
+
+[[package]]
+name = "libloading"
+version = "0.7.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c0cf036d15402bea3c5d4de17b3fce76b3e4a56ebc1f577be0e7a72f7c607cf0"
+dependencies = [
+ "cfg-if",
+ "winapi",
+]
+
+[[package]]
+name = "log"
+version = "0.4.14"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710"
+dependencies = [
+ "cfg-if",
+]
+
+[[package]]
+name = "memchr"
+version = "2.3.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525"
+
+[[package]]
+name = "nom"
+version = "6.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9c5c51b9083a3c620fa67a2a635d1ce7d95b897e957d6b28ff9a5da960a103a6"
+dependencies = [
+ "bitvec",
+ "funty",
+ "memchr",
+ "version_check",
+]
+
+[[package]]
+name = "peeking_take_while"
+version = "0.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+
+[[package]]
+name = "pkg-config"
+version = "0.3.22"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "12295df4f294471248581bc09bef3c38a5e46f1e36d6a37353621a0c6c357e1f"
+
+[[package]]
+name = "proc-macro2"
+version = "1.0.32"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ba508cc11742c0dc5c1659771673afbab7a0efab23aa17e854cbab0837ed0b43"
+dependencies = [
+ "unicode-xid",
+]
+
+[[package]]
+name = "quote"
+version = "1.0.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "38bc8cc6a5f2e3655e0899c1b848643b2562f853f114bfec7be120678e3ace05"
+dependencies = [
+ "proc-macro2",
+]
+
+[[package]]
+name = "radium"
+version = "0.5.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "941ba9d78d8e2f7ce474c015eea4d9c6d25b6a3327f9832ee29a4de27f91bbb8"
+
+[[package]]
+name = "regex"
+version = "1.4.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2a26af418b574bd56588335b3a3659a65725d4e636eb1016c2f9e3b38c7cc759"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-syntax",
+]
+
+[[package]]
+name = "regex-syntax"
+version = "0.6.25"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b"
+
+[[package]]
+name = "rustc-hash"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
+
+[[package]]
+name = "shlex"
+version = "1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "43b2853a4d09f215c24cc5489c992ce46052d359b5109343cbafbf26bc62f8a3"
+
+[[package]]
+name = "strsim"
+version = "0.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a"
+
+[[package]]
+name = "tap"
+version = "1.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
+
+[[package]]
+name = "termcolor"
+version = "1.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4"
+dependencies = [
+ "winapi-util",
+]
+
+[[package]]
+name = "textwrap"
+version = "0.11.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060"
+dependencies = [
+ "unicode-width",
+]
+
+[[package]]
+name = "unicode-width"
+version = "0.1.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3ed742d4ea2bd1176e236172c8429aaf54486e7ac098db29ffe6529e0ce50973"
+
+[[package]]
+name = "unicode-xid"
+version = "0.2.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3"
+
+[[package]]
+name = "vec_map"
+version = "0.8.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191"
+
+[[package]]
+name = "version_check"
+version = "0.9.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5fecdca9a5291cc2b8dcf7dc02453fee791a280f3743cb0905f8822ae463b3fe"
+
+[[package]]
+name = "which"
+version = "3.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d011071ae14a2f6671d0b74080ae0cd8ebf3a6f8c9589a2cd45f23126fe29724"
+dependencies = [
+ "libc",
+]
+
+[[package]]
+name = "winapi"
+version = "0.3.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+dependencies = [
+ "winapi-i686-pc-windows-gnu",
+ "winapi-x86_64-pc-windows-gnu",
+]
+
+[[package]]
+name = "winapi-i686-pc-windows-gnu"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+
+[[package]]
+name = "winapi-util"
+version = "0.1.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+dependencies = [
+ "winapi",
+]
+
+[[package]]
+name = "winapi-x86_64-pc-windows-gnu"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+
+[[package]]
+name = "wyz"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "85e60b0d1b5f99db2556934e21937020776a5d31520bf169e851ac44e6420214"
diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
new file mode 100644
index 0000000..01551cf
--- /dev/null
+++ b/bindings/rust/Cargo.toml
@@ -0,0 +1,2 @@
+[workspace]
+members = [ "libgpiod-sys" ]
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml
b/bindings/rust/libgpiod-sys/Cargo.toml
new file mode 100644
index 0000000..6c76f08
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -0,0 +1,14 @@
+[package]
+name = "libgpiod-sys"
+version = "0.1.0"
+edition = "2021"
+links = "gpiod"
+repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
+
+[features]
+default = [ "pkg-config" ]
+generate = [ "bindgen" ]
+
+[build-dependencies]
+bindgen = { version = "0.59.1", optional = true }
+pkg-config = { version = "0.3.22", optional = true }
diff --git a/bindings/rust/libgpiod-sys/README.md
b/bindings/rust/libgpiod-sys/README.md
new file mode 100644
index 0000000..594dbf4
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -0,0 +1,7 @@
+# Generated libgpiod Rust FFI bindings
+Automatically generated Rust FFI bindings via
[bindgen](https://github.com/rust-lang/rust-bindgen).
+
+## Updating bindings
+1. Clone the source from
<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
+2. run `cargo build --features generate` from `./bindings/rust/libgpiod-sys/`
+3. Commit changes in `./bindings/rust/libgpiod-sys/src/lib.rs`
diff --git a/bindings/rust/libgpiod-sys/build.rs
b/bindings/rust/libgpiod-sys/build.rs
new file mode 100644
index 0000000..cd71fc8
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -0,0 +1,166 @@
+use std::{
+    error::Error,
+    path::{Path, PathBuf},
+};
+
+fn expect_env_var(key: &str) -> String {
+    std::env::var(key)
+        .unwrap_or_else(|err| panic!("Could not find environment
variable '{}': {}", key, err))
+}
+
+fn copy_files_in_dir(directory: std::fs::ReadDir, file_name_contains:
&str, destination: &Path) {
+    if destination.exists() && destination.is_dir() {
+        directory
+            .filter_map(|entry| {
+                if let Ok(entry) = entry {
+                    let path = entry.path();
+                    path.is_file().then(|| path)
+                } else {
+                    None
+                }
+            })
+            .for_each(|file_path| {
+                if let Some(file_name) =
+
file_path.file_name().map(std::ffi::OsStr::to_str).flatten()
+                {
+                    if file_name.contains(file_name_contains) {
+                        if let Err(err) = std::fs::copy(&file_path,
&destination.join(file_name)) {
+                            println!(
+                                "cargo:warning=Could not copy {} to {}: {}",
+                                file_path.display(),
+                                destination.display(),
+                                err
+                            );
+                        }
+                    }
+                }
+            });
+    } else {
+        println!(
+            "cargo:warning=destination directory not found: {}",
+            destination.display()
+        );
+    }
+}
+
+#[cfg(feature = "pkg-config")]
+fn link_with_pkg_config_library(link_name: &str, interface: &Path) ->
Result<PathBuf, String> {
+    let library_name = format!("lib{}", link_name);
+    let library = pkg_config::probe_library(&library_name)
+        .map_err(|err| format!("Could not find {}: {}", library_name, err))?;
+    library
+        .include_paths
+        .iter()
+        .map(|include_path| include_path.join(interface))
+        .fold(None, |current, header_path| {
+            if current.is_none() && header_path.exists() {
+                Some(header_path)
+            } else {
+                current
+            }
+        })
+        .ok_or_else(|| {
+            format!(
+                "Could not find {} in any of {:?}, provided by pkg-config",
+                interface.display(),
+                library.include_paths
+            )
+        })
+        .map_err(Into::into)
+}
+
+#[cfg(feature = "generate")]
+fn generate_bindings(header_file: &Path, out_file: &Path) {
+    const SYMBOL_PREFIX_REGEX: &str = "(?i)gpiod_.*";
+
+    let mut output = bindgen::builder()
+        .header(header_file.display().to_string())
+        .allowlist_function(SYMBOL_PREFIX_REGEX)
+        .allowlist_type(SYMBOL_PREFIX_REGEX)
+        .allowlist_var(SYMBOL_PREFIX_REGEX)
+        .generate_comments(false)
+        .generate()
+        .expect("Could not generate bindings")
+        .to_string();
+
+    // add some niceties after the autogenerated comment
+    output.insert_str(
+        output.find('\n').expect("Nothing was generated") + 1,
+        concat!(
+            "\n",
+            "#![allow(deref_nullptr)]\n",
+            "#![allow(non_camel_case_types)]\n",
+            "#![allow(non_snake_case)]\n",
+            "#![allow(non_upper_case_globals)]\n",
+            "#![doc = include_str!(\"../README.md\")]\n"
+        ),
+    );
+
+    output.push_str(concat!(
+        "\n",
+        "#[cfg(test)]\n",
+        "mod tests {\n",
+        "    use super::*;\n",
+        "\n",
+        "    #[test]\n",
+        "    fn link_check() {\n",
+        "        use std::ffi::CStr;\n",
+        "\n",
+        "        assert!(!unsafe { CStr::from_ptr(gpiod_version_string()) }\n",
+        "            .to_string_lossy()\n",
+        "            .is_empty());\n",
+        "    }\n",
+        "}\n"
+    ));
+
+    std::fs::write(out_file, &*output)
+        .unwrap_or_else(|err| panic!("Could not write to {}: {}",
out_file.display(), err));
+}
+
+fn main() {
+    let header_file_name = Path::new("gpiod.h");
+    let out_dir = PathBuf::from(expect_env_var("OUT_DIR"));
+    let library = expect_env_var("CARGO_MANIFEST_LINKS");
+
+    let rel_source_dir_root = Path::new("../../../");
+    let header_path =
rel_source_dir_root.join("include").join(header_file_name);
+    let library_path = rel_source_dir_root.join("lib").join(".libs");
+
+    #[allow(unused_mut)]
+    let mut header_path: Result<PathBuf, Box<dyn Error>> = if
header_path.exists() {
+        println!("cargo:rerun-if-changed={}", header_path.display());
+        println!("cargo:rerun-if-changed={}", library_path.display());
+        println!("cargo:rustc-link-lib={}", library);
+
+        if let Ok(dir_iter) = library_path.read_dir() {
+            println!("cargo:rustc-link-search={}", out_dir.display());
+            copy_files_in_dir(dir_iter, ".so", &out_dir);
+        } else {
+            println!(
+                "cargo:warning=Could not find library built in {}.
Linking may fail.",
+                library_path.display()
+            );
+        }
+
+        Ok(header_path)
+    } else {
+        Err("Could not find source directory".into())
+    };
+
+    #[cfg(feature = "pkg-config")]
+    if header_path.is_err() {
+        header_path = link_with_pkg_config_library(&library,
header_file_name).map_err(Into::into);
+    }
+
+    #[cfg(feature = "generate")]
+    generate_bindings(
+        header_path
+            .as_ref()
+            .unwrap_or_else(|err| panic!("Could not find {}: {}",
header_file_name.display(), err)),
+        Path::new("./src/lib.rs"),
+    );
+
+    if let Err(err) = header_path {
+        panic!("Could not find lib{}: {}", library, err);
+    }
+}
-- 
2.34.1

```

```
From 96b623298145f5f2d2e13e3aaa20098ca26e73bb Mon Sep 17 00:00:00 2001
From: Gerard Ryan <G.M0N3Y.2503@gmail.com>
Date: Sat, 6 Nov 2021 21:25:46 +1000
Subject: [PATCH 2/2] Generated rust sys bindings from 4da9f5b

Signed-off-by: Gerard Ryan <G.M0N3Y.2503@gmail.com>
---
 bindings/rust/libgpiod-sys/src/lib.rs | 588 ++++++++++++++++++++++++++
 1 file changed, 588 insertions(+)
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs

diff --git a/bindings/rust/libgpiod-sys/src/lib.rs
b/bindings/rust/libgpiod-sys/src/lib.rs
new file mode 100644
index 0000000..470ff60
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -0,0 +1,588 @@
+/* automatically generated by rust-bindgen 0.59.1 */
+
+#![allow(deref_nullptr)]
+#![allow(non_camel_case_types)]
+#![allow(non_snake_case)]
+#![allow(non_upper_case_globals)]
+#![doc = include_str!("../README.md")]
+
+pub type __time_t = ::std::os::raw::c_long;
+pub type __syscall_slong_t = ::std::os::raw::c_long;
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct timespec {
+    pub tv_sec: __time_t,
+    pub tv_nsec: __syscall_slong_t,
+}
+#[test]
+fn bindgen_test_layout_timespec() {
+    assert_eq!(
+        ::std::mem::size_of::<timespec>(),
+        16usize,
+        concat!("Size of: ", stringify!(timespec))
+    );
+    assert_eq!(
+        ::std::mem::align_of::<timespec>(),
+        8usize,
+        concat!("Alignment of ", stringify!(timespec))
+    );
+    assert_eq!(
+        unsafe { &(*(::std::ptr::null::<timespec>())).tv_sec as
*const _ as usize },
+        0usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(timespec),
+            "::",
+            stringify!(tv_sec)
+        )
+    );
+    assert_eq!(
+        unsafe { &(*(::std::ptr::null::<timespec>())).tv_nsec as
*const _ as usize },
+        8usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(timespec),
+            "::",
+            stringify!(tv_nsec)
+        )
+    );
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_chip {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_bulk {
+    _unused: [u8; 0],
+}
+extern "C" {
+    pub fn gpiod_is_gpiochip_device(path: *const
::std::os::raw::c_char) -> bool;
+}
+extern "C" {
+    pub fn gpiod_chip_open(path: *const ::std::os::raw::c_char) ->
*mut gpiod_chip;
+}
+extern "C" {
+    pub fn gpiod_chip_ref(chip: *mut gpiod_chip) -> *mut gpiod_chip;
+}
+extern "C" {
+    pub fn gpiod_chip_unref(chip: *mut gpiod_chip);
+}
+extern "C" {
+    pub fn gpiod_chip_get_name(chip: *mut gpiod_chip) -> *const
::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiod_chip_get_label(chip: *mut gpiod_chip) -> *const
::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiod_chip_get_num_lines(chip: *mut gpiod_chip) ->
::std::os::raw::c_uint;
+}
+extern "C" {
+    pub fn gpiod_chip_get_line(
+        chip: *mut gpiod_chip,
+        offset: ::std::os::raw::c_uint,
+    ) -> *mut gpiod_line;
+}
+extern "C" {
+    pub fn gpiod_chip_get_lines(
+        chip: *mut gpiod_chip,
+        offsets: *mut ::std::os::raw::c_uint,
+        num_offsets: ::std::os::raw::c_uint,
+    ) -> *mut gpiod_line_bulk;
+}
+extern "C" {
+    pub fn gpiod_chip_get_all_lines(chip: *mut gpiod_chip) -> *mut
gpiod_line_bulk;
+}
+extern "C" {
+    pub fn gpiod_chip_find_line(
+        chip: *mut gpiod_chip,
+        name: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_bulk_new(max_lines: ::std::os::raw::c_uint) ->
*mut gpiod_line_bulk;
+}
+extern "C" {
+    pub fn gpiod_line_bulk_reset(bulk: *mut gpiod_line_bulk);
+}
+extern "C" {
+    pub fn gpiod_line_bulk_free(bulk: *mut gpiod_line_bulk);
+}
+extern "C" {
+    pub fn gpiod_line_bulk_add_line(
+        bulk: *mut gpiod_line_bulk,
+        line: *mut gpiod_line,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_bulk_get_line(
+        bulk: *mut gpiod_line_bulk,
+        index: ::std::os::raw::c_uint,
+    ) -> *mut gpiod_line;
+}
+extern "C" {
+    pub fn gpiod_line_bulk_num_lines(bulk: *mut gpiod_line_bulk) ->
::std::os::raw::c_uint;
+}
+pub const GPIOD_LINE_BULK_CB_NEXT: ::std::os::raw::c_uint = 0;
+pub const GPIOD_LINE_BULK_CB_STOP: ::std::os::raw::c_uint = 1;
+pub type _bindgen_ty_1 = ::std::os::raw::c_uint;
+pub type gpiod_line_bulk_foreach_cb = ::std::option::Option<
+    unsafe extern "C" fn(
+        arg1: *mut gpiod_line,
+        arg2: *mut ::std::os::raw::c_void,
+    ) -> ::std::os::raw::c_int,
+>;
+extern "C" {
+    pub fn gpiod_line_bulk_foreach_line(
+        bulk: *mut gpiod_line_bulk,
+        func: gpiod_line_bulk_foreach_cb,
+        data: *mut ::std::os::raw::c_void,
+    );
+}
+pub const GPIOD_LINE_DIRECTION_INPUT: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_DIRECTION_OUTPUT: ::std::os::raw::c_uint = 2;
+pub type _bindgen_ty_2 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_DRIVE_PUSH_PULL: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_DRIVE_OPEN_DRAIN: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_DRIVE_OPEN_SOURCE: ::std::os::raw::c_uint = 3;
+pub type _bindgen_ty_3 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_BIAS_UNKNOWN: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_BIAS_DISABLED: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_BIAS_PULL_UP: ::std::os::raw::c_uint = 3;
+pub const GPIOD_LINE_BIAS_PULL_DOWN: ::std::os::raw::c_uint = 4;
+pub type _bindgen_ty_4 = ::std::os::raw::c_uint;
+extern "C" {
+    pub fn gpiod_line_offset(line: *mut gpiod_line) -> ::std::os::raw::c_uint;
+}
+extern "C" {
+    pub fn gpiod_line_name(line: *mut gpiod_line) -> *const
::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiod_line_consumer(line: *mut gpiod_line) -> *const
::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiod_line_direction(line: *mut gpiod_line) ->
::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_is_active_low(line: *mut gpiod_line) -> bool;
+}
+extern "C" {
+    pub fn gpiod_line_bias(line: *mut gpiod_line) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_is_used(line: *mut gpiod_line) -> bool;
+}
+extern "C" {
+    pub fn gpiod_line_drive(line: *mut gpiod_line) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_get_chip(line: *mut gpiod_line) -> *mut gpiod_chip;
+}
+pub const GPIOD_LINE_REQUEST_DIRECTION_AS_IS: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_REQUEST_DIRECTION_INPUT: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_REQUEST_DIRECTION_OUTPUT: ::std::os::raw::c_uint = 3;
+pub const GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE: ::std::os::raw::c_uint = 4;
+pub const GPIOD_LINE_REQUEST_EVENT_RISING_EDGE: ::std::os::raw::c_uint = 5;
+pub const GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES: ::std::os::raw::c_uint = 6;
+pub type _bindgen_ty_5 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW: ::std::os::raw::c_uint = 4;
+pub const GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED: ::std::os::raw::c_uint = 8;
+pub const GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN: ::std::os::raw::c_uint = 16;
+pub const GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP: ::std::os::raw::c_uint = 32;
+pub type _bindgen_ty_6 = ::std::os::raw::c_uint;
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_request_config {
+    pub consumer: *const ::std::os::raw::c_char,
+    pub request_type: ::std::os::raw::c_int,
+    pub flags: ::std::os::raw::c_int,
+}
+#[test]
+fn bindgen_test_layout_gpiod_line_request_config() {
+    assert_eq!(
+        ::std::mem::size_of::<gpiod_line_request_config>(),
+        16usize,
+        concat!("Size of: ", stringify!(gpiod_line_request_config))
+    );
+    assert_eq!(
+        ::std::mem::align_of::<gpiod_line_request_config>(),
+        8usize,
+        concat!("Alignment of ", stringify!(gpiod_line_request_config))
+    );
+    assert_eq!(
+        unsafe {
+            &(*(::std::ptr::null::<gpiod_line_request_config>())).consumer
as *const _ as usize
+        },
+        0usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(gpiod_line_request_config),
+            "::",
+            stringify!(consumer)
+        )
+    );
+    assert_eq!(
+        unsafe {
+            &(*(::std::ptr::null::<gpiod_line_request_config>())).request_type
as *const _ as usize
+        },
+        8usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(gpiod_line_request_config),
+            "::",
+            stringify!(request_type)
+        )
+    );
+    assert_eq!(
+        unsafe {
&(*(::std::ptr::null::<gpiod_line_request_config>())).flags as *const
_ as usize },
+        12usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(gpiod_line_request_config),
+            "::",
+            stringify!(flags)
+        )
+    );
+}
+extern "C" {
+    pub fn gpiod_line_request(
+        line: *mut gpiod_line,
+        config: *const gpiod_line_request_config,
+        default_val: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_input(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_output(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+        default_val: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_rising_edge_events(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_falling_edge_events(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_both_edges_events(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_input_flags(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_output_flags(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+        default_val: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_rising_edge_events_flags(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_falling_edge_events_flags(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_both_edges_events_flags(
+        line: *mut gpiod_line,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk(
+        bulk: *mut gpiod_line_bulk,
+        config: *const gpiod_line_request_config,
+        default_vals: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_input(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_output(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+        default_vals: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_rising_edge_events(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_falling_edge_events(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_both_edges_events(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_input_flags(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_output_flags(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+        default_vals: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_rising_edge_events_flags(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_falling_edge_events_flags(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_request_bulk_both_edges_events_flags(
+        bulk: *mut gpiod_line_bulk,
+        consumer: *const ::std::os::raw::c_char,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_release(line: *mut gpiod_line);
+}
+extern "C" {
+    pub fn gpiod_line_release_bulk(bulk: *mut gpiod_line_bulk);
+}
+extern "C" {
+    pub fn gpiod_line_get_value(line: *mut gpiod_line) ->
::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_get_value_bulk(
+        bulk: *mut gpiod_line_bulk,
+        values: *mut ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_value(
+        line: *mut gpiod_line,
+        value: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_value_bulk(
+        bulk: *mut gpiod_line_bulk,
+        values: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_config(
+        line: *mut gpiod_line,
+        direction: ::std::os::raw::c_int,
+        flags: ::std::os::raw::c_int,
+        value: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_config_bulk(
+        bulk: *mut gpiod_line_bulk,
+        direction: ::std::os::raw::c_int,
+        flags: ::std::os::raw::c_int,
+        values: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_flags(
+        line: *mut gpiod_line,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_flags_bulk(
+        bulk: *mut gpiod_line_bulk,
+        flags: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_direction_input(line: *mut gpiod_line) ->
::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_direction_input_bulk(bulk: *mut gpiod_line_bulk)
+        -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_direction_output(
+        line: *mut gpiod_line,
+        value: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_set_direction_output_bulk(
+        bulk: *mut gpiod_line_bulk,
+        values: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+pub const GPIOD_LINE_EVENT_RISING_EDGE: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_EVENT_FALLING_EDGE: ::std::os::raw::c_uint = 2;
+pub type _bindgen_ty_7 = ::std::os::raw::c_uint;
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_event {
+    pub ts: timespec,
+    pub event_type: ::std::os::raw::c_int,
+    pub offset: ::std::os::raw::c_int,
+}
+#[test]
+fn bindgen_test_layout_gpiod_line_event() {
+    assert_eq!(
+        ::std::mem::size_of::<gpiod_line_event>(),
+        24usize,
+        concat!("Size of: ", stringify!(gpiod_line_event))
+    );
+    assert_eq!(
+        ::std::mem::align_of::<gpiod_line_event>(),
+        8usize,
+        concat!("Alignment of ", stringify!(gpiod_line_event))
+    );
+    assert_eq!(
+        unsafe { &(*(::std::ptr::null::<gpiod_line_event>())).ts as
*const _ as usize },
+        0usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(gpiod_line_event),
+            "::",
+            stringify!(ts)
+        )
+    );
+    assert_eq!(
+        unsafe {
&(*(::std::ptr::null::<gpiod_line_event>())).event_type as *const _ as
usize },
+        16usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(gpiod_line_event),
+            "::",
+            stringify!(event_type)
+        )
+    );
+    assert_eq!(
+        unsafe { &(*(::std::ptr::null::<gpiod_line_event>())).offset
as *const _ as usize },
+        20usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(gpiod_line_event),
+            "::",
+            stringify!(offset)
+        )
+    );
+}
+extern "C" {
+    pub fn gpiod_line_event_wait(
+        line: *mut gpiod_line,
+        timeout: *const timespec,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_event_wait_bulk(
+        bulk: *mut gpiod_line_bulk,
+        timeout: *const timespec,
+        event_bulk: *mut gpiod_line_bulk,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_event_read(
+        line: *mut gpiod_line,
+        event: *mut gpiod_line_event,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_event_read_multiple(
+        line: *mut gpiod_line,
+        events: *mut gpiod_line_event,
+        num_events: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_event_get_fd(line: *mut gpiod_line) ->
::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_event_read_fd(
+        fd: ::std::os::raw::c_int,
+        event: *mut gpiod_line_event,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_line_event_read_fd_multiple(
+        fd: ::std::os::raw::c_int,
+        events: *mut gpiod_line_event,
+        num_events: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiod_version_string() -> *const ::std::os::raw::c_char;
+}
+
+#[cfg(test)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn link_check() {
+        use std::ffi::CStr;
+
+        assert!(!unsafe { CStr::from_ptr(gpiod_version_string()) }
+            .to_string_lossy()
+            .is_empty());
+    }
+}
-- 
2.34.1

```

--000000000000c8ef4305d33f994b
Content-Type: text/plain; charset="US-ASCII"; name="LICENSE.txt"
Content-Disposition: attachment; filename="LICENSE.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kx8q9fwp2>
X-Attachment-Id: f_kx8q9fwp2

TUlUIExpY2Vuc2UKCkNvcHlyaWdodCAoYykgMjAyMSBHZXJhcmQgUnlhbgoKUGVybWlzc2lvbiBp
cyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5n
IGEgY29weQpvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmls
ZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAppbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0
cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCnRvIHVzZSwg
Y29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5k
L29yIHNlbGwKY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRv
IHdob20gdGhlIFNvZnR3YXJlIGlzCmZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUg
Zm9sbG93aW5nIGNvbmRpdGlvbnM6CgpUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhp
cyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwKY29waWVzIG9yIHN1
YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KClRIRSBTT0ZUV0FSRSBJUyBQUk9W
SURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCklN
UExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVS
Q0hBTlRBQklMSVRZLApGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5G
UklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9M
REVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgpMSUFCSUxJVFks
IFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJ
U0lORyBGUk9NLApPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBU
SEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRQpTT0ZUV0FSRS4K
--000000000000c8ef4305d33f994b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-Generated-rust-sys-bindings-from-4da9f5b.patch"
Content-Disposition: attachment; 
	filename="0002-Generated-rust-sys-bindings-from-4da9f5b.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kx8q1oqt1>
X-Attachment-Id: f_kx8q1oqt1

RnJvbSA5NmI2MjMyOTgxNDVmNWYyZDJlMTNlM2FhYTIwMDk4Y2EyNmU3M2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHZXJhcmQgUnlhbiA8Ry5NME4zWS4yNTAzQGdtYWlsLmNvbT4K
RGF0ZTogU2F0LCA2IE5vdiAyMDIxIDIxOjI1OjQ2ICsxMDAwClN1YmplY3Q6IFtQQVRDSCAyLzJd
IEdlbmVyYXRlZCBydXN0IHN5cyBiaW5kaW5ncyBmcm9tIDRkYTlmNWIKClNpZ25lZC1vZmYtYnk6
IEdlcmFyZCBSeWFuIDxHLk0wTjNZLjI1MDNAZ21haWwuY29tPgotLS0KIGJpbmRpbmdzL3J1c3Qv
bGliZ3Bpb2Qtc3lzL3NyYy9saWIucnMgfCA1ODggKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1ODggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJp
bmRpbmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL3NyYy9saWIucnMKCmRpZmYgLS1naXQgYS9iaW5kaW5n
cy9ydXN0L2xpYmdwaW9kLXN5cy9zcmMvbGliLnJzIGIvYmluZGluZ3MvcnVzdC9saWJncGlvZC1z
eXMvc3JjL2xpYi5ycwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi40NzBmZjYw
Ci0tLSAvZGV2L251bGwKKysrIGIvYmluZGluZ3MvcnVzdC9saWJncGlvZC1zeXMvc3JjL2xpYi5y
cwpAQCAtMCwwICsxLDU4OCBAQAorLyogYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgYnkgcnVzdC1i
aW5kZ2VuIDAuNTkuMSAqLworCisjIVthbGxvdyhkZXJlZl9udWxscHRyKV0KKyMhW2FsbG93KG5v
bl9jYW1lbF9jYXNlX3R5cGVzKV0KKyMhW2FsbG93KG5vbl9zbmFrZV9jYXNlKV0KKyMhW2FsbG93
KG5vbl91cHBlcl9jYXNlX2dsb2JhbHMpXQorIyFbZG9jID0gaW5jbHVkZV9zdHIhKCIuLi9SRUFE
TUUubWQiKV0KKworcHViIHR5cGUgX190aW1lX3QgPSA6OnN0ZDo6b3M6OnJhdzo6Y19sb25nOwor
cHViIHR5cGUgX19zeXNjYWxsX3Nsb25nX3QgPSA6OnN0ZDo6b3M6OnJhdzo6Y19sb25nOworI1ty
ZXByKEMpXQorI1tkZXJpdmUoRGVidWcsIENvcHksIENsb25lKV0KK3B1YiBzdHJ1Y3QgdGltZXNw
ZWMgeworICAgIHB1YiB0dl9zZWM6IF9fdGltZV90LAorICAgIHB1YiB0dl9uc2VjOiBfX3N5c2Nh
bGxfc2xvbmdfdCwKK30KKyNbdGVzdF0KK2ZuIGJpbmRnZW5fdGVzdF9sYXlvdXRfdGltZXNwZWMo
KSB7CisgICAgYXNzZXJ0X2VxISgKKyAgICAgICAgOjpzdGQ6Om1lbTo6c2l6ZV9vZjo6PHRpbWVz
cGVjPigpLAorICAgICAgICAxNnVzaXplLAorICAgICAgICBjb25jYXQhKCJTaXplIG9mOiAiLCBz
dHJpbmdpZnkhKHRpbWVzcGVjKSkKKyAgICApOworICAgIGFzc2VydF9lcSEoCisgICAgICAgIDo6
c3RkOjptZW06OmFsaWduX29mOjo8dGltZXNwZWM+KCksCisgICAgICAgIDh1c2l6ZSwKKyAgICAg
ICAgY29uY2F0ISgiQWxpZ25tZW50IG9mICIsIHN0cmluZ2lmeSEodGltZXNwZWMpKQorICAgICk7
CisgICAgYXNzZXJ0X2VxISgKKyAgICAgICAgdW5zYWZlIHsgJigqKDo6c3RkOjpwdHI6Om51bGw6
Ojx0aW1lc3BlYz4oKSkpLnR2X3NlYyBhcyAqY29uc3QgXyBhcyB1c2l6ZSB9LAorICAgICAgICAw
dXNpemUsCisgICAgICAgIGNvbmNhdCEoCisgICAgICAgICAgICAiT2Zmc2V0IG9mIGZpZWxkOiAi
LAorICAgICAgICAgICAgc3RyaW5naWZ5ISh0aW1lc3BlYyksCisgICAgICAgICAgICAiOjoiLAor
ICAgICAgICAgICAgc3RyaW5naWZ5ISh0dl9zZWMpCisgICAgICAgICkKKyAgICApOworICAgIGFz
c2VydF9lcSEoCisgICAgICAgIHVuc2FmZSB7ICYoKig6OnN0ZDo6cHRyOjpudWxsOjo8dGltZXNw
ZWM+KCkpKS50dl9uc2VjIGFzICpjb25zdCBfIGFzIHVzaXplIH0sCisgICAgICAgIDh1c2l6ZSwK
KyAgICAgICAgY29uY2F0ISgKKyAgICAgICAgICAgICJPZmZzZXQgb2YgZmllbGQ6ICIsCisgICAg
ICAgICAgICBzdHJpbmdpZnkhKHRpbWVzcGVjKSwKKyAgICAgICAgICAgICI6OiIsCisgICAgICAg
ICAgICBzdHJpbmdpZnkhKHR2X25zZWMpCisgICAgICAgICkKKyAgICApOworfQorI1tyZXByKEMp
XQorI1tkZXJpdmUoRGVidWcsIENvcHksIENsb25lKV0KK3B1YiBzdHJ1Y3QgZ3Bpb2RfY2hpcCB7
CisgICAgX3VudXNlZDogW3U4OyAwXSwKK30KKyNbcmVwcihDKV0KKyNbZGVyaXZlKERlYnVnLCBD
b3B5LCBDbG9uZSldCitwdWIgc3RydWN0IGdwaW9kX2xpbmUgeworICAgIF91bnVzZWQ6IFt1ODsg
MF0sCit9CisjW3JlcHIoQyldCisjW2Rlcml2ZShEZWJ1ZywgQ29weSwgQ2xvbmUpXQorcHViIHN0
cnVjdCBncGlvZF9saW5lX2J1bGsgeworICAgIF91bnVzZWQ6IFt1ODsgMF0sCit9CitleHRlcm4g
IkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfaXNfZ3Bpb2NoaXBfZGV2aWNlKHBhdGg6ICpjb25zdCA6
OnN0ZDo6b3M6OnJhdzo6Y19jaGFyKSAtPiBib29sOworfQorZXh0ZXJuICJDIiB7CisgICAgcHVi
IGZuIGdwaW9kX2NoaXBfb3BlbihwYXRoOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhcikg
LT4gKm11dCBncGlvZF9jaGlwOworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2No
aXBfcmVmKGNoaXA6ICptdXQgZ3Bpb2RfY2hpcCkgLT4gKm11dCBncGlvZF9jaGlwOworfQorZXh0
ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2NoaXBfdW5yZWYoY2hpcDogKm11dCBncGlvZF9j
aGlwKTsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9jaGlwX2dldF9uYW1lKGNo
aXA6ICptdXQgZ3Bpb2RfY2hpcCkgLT4gKmNvbnN0IDo6c3RkOjpvczo6cmF3OjpjX2NoYXI7Cit9
CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfY2hpcF9nZXRfbGFiZWwoY2hpcDogKm11
dCBncGlvZF9jaGlwKSAtPiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhcjsKK30KK2V4dGVy
biAiQyIgeworICAgIHB1YiBmbiBncGlvZF9jaGlwX2dldF9udW1fbGluZXMoY2hpcDogKm11dCBn
cGlvZF9jaGlwKSAtPiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50OworfQorZXh0ZXJuICJDIiB7Cisg
ICAgcHViIGZuIGdwaW9kX2NoaXBfZ2V0X2xpbmUoCisgICAgICAgIGNoaXA6ICptdXQgZ3Bpb2Rf
Y2hpcCwKKyAgICAgICAgb2Zmc2V0OiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50LAorICAgICkgLT4g
Km11dCBncGlvZF9saW5lOworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2NoaXBf
Z2V0X2xpbmVzKAorICAgICAgICBjaGlwOiAqbXV0IGdwaW9kX2NoaXAsCisgICAgICAgIG9mZnNl
dHM6ICptdXQgOjpzdGQ6Om9zOjpyYXc6OmNfdWludCwKKyAgICAgICAgbnVtX29mZnNldHM6IDo6
c3RkOjpvczo6cmF3OjpjX3VpbnQsCisgICAgKSAtPiAqbXV0IGdwaW9kX2xpbmVfYnVsazsKK30K
K2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9jaGlwX2dldF9hbGxfbGluZXMoY2hpcDog
Km11dCBncGlvZF9jaGlwKSAtPiAqbXV0IGdwaW9kX2xpbmVfYnVsazsKK30KK2V4dGVybiAiQyIg
eworICAgIHB1YiBmbiBncGlvZF9jaGlwX2ZpbmRfbGluZSgKKyAgICAgICAgY2hpcDogKm11dCBn
cGlvZF9jaGlwLAorICAgICAgICBuYW1lOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwK
KyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1
YiBmbiBncGlvZF9saW5lX2J1bGtfbmV3KG1heF9saW5lczogOjpzdGQ6Om9zOjpyYXc6OmNfdWlu
dCkgLT4gKm11dCBncGlvZF9saW5lX2J1bGs7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4g
Z3Bpb2RfbGluZV9idWxrX3Jlc2V0KGJ1bGs6ICptdXQgZ3Bpb2RfbGluZV9idWxrKTsKK30KK2V4
dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2J1bGtfZnJlZShidWxrOiAqbXV0IGdw
aW9kX2xpbmVfYnVsayk7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfbGluZV9i
dWxrX2FkZF9saW5lKAorICAgICAgICBidWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICAg
ICAgbGluZTogKm11dCBncGlvZF9saW5lLAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50
OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfYnVsa19nZXRfbGluZSgK
KyAgICAgICAgYnVsazogKm11dCBncGlvZF9saW5lX2J1bGssCisgICAgICAgIGluZGV4OiA6OnN0
ZDo6b3M6OnJhdzo6Y191aW50LAorICAgICkgLT4gKm11dCBncGlvZF9saW5lOworfQorZXh0ZXJu
ICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfYnVsa19udW1fbGluZXMoYnVsazogKm11dCBn
cGlvZF9saW5lX2J1bGspIC0+IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQ7Cit9CitwdWIgY29uc3Qg
R1BJT0RfTElORV9CVUxLX0NCX05FWFQ6IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQgPSAwOworcHVi
IGNvbnN0IEdQSU9EX0xJTkVfQlVMS19DQl9TVE9QOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50ID0g
MTsKK3B1YiB0eXBlIF9iaW5kZ2VuX3R5XzEgPSA6OnN0ZDo6b3M6OnJhdzo6Y191aW50OworcHVi
IHR5cGUgZ3Bpb2RfbGluZV9idWxrX2ZvcmVhY2hfY2IgPSA6OnN0ZDo6b3B0aW9uOjpPcHRpb248
CisgICAgdW5zYWZlIGV4dGVybiAiQyIgZm4oCisgICAgICAgIGFyZzE6ICptdXQgZ3Bpb2RfbGlu
ZSwKKyAgICAgICAgYXJnMjogKm11dCA6OnN0ZDo6b3M6OnJhdzo6Y192b2lkLAorICAgICkgLT4g
OjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorPjsKK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlv
ZF9saW5lX2J1bGtfZm9yZWFjaF9saW5lKAorICAgICAgICBidWxrOiAqbXV0IGdwaW9kX2xpbmVf
YnVsaywKKyAgICAgICAgZnVuYzogZ3Bpb2RfbGluZV9idWxrX2ZvcmVhY2hfY2IsCisgICAgICAg
IGRhdGE6ICptdXQgOjpzdGQ6Om9zOjpyYXc6OmNfdm9pZCwKKyAgICApOworfQorcHViIGNvbnN0
IEdQSU9EX0xJTkVfRElSRUNUSU9OX0lOUFVUOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50ID0gMTsK
K3B1YiBjb25zdCBHUElPRF9MSU5FX0RJUkVDVElPTl9PVVRQVVQ6IDo6c3RkOjpvczo6cmF3Ojpj
X3VpbnQgPSAyOworcHViIHR5cGUgX2JpbmRnZW5fdHlfMiA9IDo6c3RkOjpvczo6cmF3OjpjX3Vp
bnQ7CitwdWIgY29uc3QgR1BJT0RfTElORV9EUklWRV9QVVNIX1BVTEw6IDo6c3RkOjpvczo6cmF3
OjpjX3VpbnQgPSAxOworcHViIGNvbnN0IEdQSU9EX0xJTkVfRFJJVkVfT1BFTl9EUkFJTjogOjpz
dGQ6Om9zOjpyYXc6OmNfdWludCA9IDI7CitwdWIgY29uc3QgR1BJT0RfTElORV9EUklWRV9PUEVO
X1NPVVJDRTogOjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9IDM7CitwdWIgdHlwZSBfYmluZGdlbl90
eV8zID0gOjpzdGQ6Om9zOjpyYXc6OmNfdWludDsKK3B1YiBjb25zdCBHUElPRF9MSU5FX0JJQVNf
VU5LTk9XTjogOjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9IDE7CitwdWIgY29uc3QgR1BJT0RfTElO
RV9CSUFTX0RJU0FCTEVEOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50ID0gMjsKK3B1YiBjb25zdCBH
UElPRF9MSU5FX0JJQVNfUFVMTF9VUDogOjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9IDM7CitwdWIg
Y29uc3QgR1BJT0RfTElORV9CSUFTX1BVTExfRE9XTjogOjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9
IDQ7CitwdWIgdHlwZSBfYmluZGdlbl90eV80ID0gOjpzdGQ6Om9zOjpyYXc6OmNfdWludDsKK2V4
dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX29mZnNldChsaW5lOiAqbXV0IGdwaW9k
X2xpbmUpIC0+IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQ7Cit9CitleHRlcm4gIkMiIHsKKyAgICBw
dWIgZm4gZ3Bpb2RfbGluZV9uYW1lKGxpbmU6ICptdXQgZ3Bpb2RfbGluZSkgLT4gKmNvbnN0IDo6
c3RkOjpvczo6cmF3OjpjX2NoYXI7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2Rf
bGluZV9jb25zdW1lcihsaW5lOiAqbXV0IGdwaW9kX2xpbmUpIC0+ICpjb25zdCA6OnN0ZDo6b3M6
OnJhdzo6Y19jaGFyOworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfZGly
ZWN0aW9uKGxpbmU6ICptdXQgZ3Bpb2RfbGluZSkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50Owor
fQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfaXNfYWN0aXZlX2xvdyhsaW5l
OiAqbXV0IGdwaW9kX2xpbmUpIC0+IGJvb2w7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4g
Z3Bpb2RfbGluZV9iaWFzKGxpbmU6ICptdXQgZ3Bpb2RfbGluZSkgLT4gOjpzdGQ6Om9zOjpyYXc6
OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfaXNfdXNlZChs
aW5lOiAqbXV0IGdwaW9kX2xpbmUpIC0+IGJvb2w7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIg
Zm4gZ3Bpb2RfbGluZV9kcml2ZShsaW5lOiAqbXV0IGdwaW9kX2xpbmUpIC0+IDo6c3RkOjpvczo6
cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2dldF9j
aGlwKGxpbmU6ICptdXQgZ3Bpb2RfbGluZSkgLT4gKm11dCBncGlvZF9jaGlwOworfQorcHViIGNv
bnN0IEdQSU9EX0xJTkVfUkVRVUVTVF9ESVJFQ1RJT05fQVNfSVM6IDo6c3RkOjpvczo6cmF3Ojpj
X3VpbnQgPSAxOworcHViIGNvbnN0IEdQSU9EX0xJTkVfUkVRVUVTVF9ESVJFQ1RJT05fSU5QVVQ6
IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQgPSAyOworcHViIGNvbnN0IEdQSU9EX0xJTkVfUkVRVUVT
VF9ESVJFQ1RJT05fT1VUUFVUOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50ID0gMzsKK3B1YiBjb25z
dCBHUElPRF9MSU5FX1JFUVVFU1RfRVZFTlRfRkFMTElOR19FREdFOiA6OnN0ZDo6b3M6OnJhdzo6
Y191aW50ID0gNDsKK3B1YiBjb25zdCBHUElPRF9MSU5FX1JFUVVFU1RfRVZFTlRfUklTSU5HX0VE
R0U6IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQgPSA1OworcHViIGNvbnN0IEdQSU9EX0xJTkVfUkVR
VUVTVF9FVkVOVF9CT1RIX0VER0VTOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50ID0gNjsKK3B1YiB0
eXBlIF9iaW5kZ2VuX3R5XzUgPSA6OnN0ZDo6b3M6OnJhdzo6Y191aW50OworcHViIGNvbnN0IEdQ
SU9EX0xJTkVfUkVRVUVTVF9GTEFHX09QRU5fRFJBSU46IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQg
PSAxOworcHViIGNvbnN0IEdQSU9EX0xJTkVfUkVRVUVTVF9GTEFHX09QRU5fU09VUkNFOiA6OnN0
ZDo6b3M6OnJhdzo6Y191aW50ID0gMjsKK3B1YiBjb25zdCBHUElPRF9MSU5FX1JFUVVFU1RfRkxB
R19BQ1RJVkVfTE9XOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50ID0gNDsKK3B1YiBjb25zdCBHUElP
RF9MSU5FX1JFUVVFU1RfRkxBR19CSUFTX0RJU0FCTEVEOiA6OnN0ZDo6b3M6OnJhdzo6Y191aW50
ID0gODsKK3B1YiBjb25zdCBHUElPRF9MSU5FX1JFUVVFU1RfRkxBR19CSUFTX1BVTExfRE9XTjog
OjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9IDE2OworcHViIGNvbnN0IEdQSU9EX0xJTkVfUkVRVUVT
VF9GTEFHX0JJQVNfUFVMTF9VUDogOjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9IDMyOworcHViIHR5
cGUgX2JpbmRnZW5fdHlfNiA9IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQ7CisjW3JlcHIoQyldCisj
W2Rlcml2ZShEZWJ1ZywgQ29weSwgQ2xvbmUpXQorcHViIHN0cnVjdCBncGlvZF9saW5lX3JlcXVl
c3RfY29uZmlnIHsKKyAgICBwdWIgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19j
aGFyLAorICAgIHB1YiByZXF1ZXN0X3R5cGU6IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICBw
dWIgZmxhZ3M6IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKK30KKyNbdGVzdF0KK2ZuIGJpbmRnZW5f
dGVzdF9sYXlvdXRfZ3Bpb2RfbGluZV9yZXF1ZXN0X2NvbmZpZygpIHsKKyAgICBhc3NlcnRfZXEh
KAorICAgICAgICA6OnN0ZDo6bWVtOjpzaXplX29mOjo8Z3Bpb2RfbGluZV9yZXF1ZXN0X2NvbmZp
Zz4oKSwKKyAgICAgICAgMTZ1c2l6ZSwKKyAgICAgICAgY29uY2F0ISgiU2l6ZSBvZjogIiwgc3Ry
aW5naWZ5IShncGlvZF9saW5lX3JlcXVlc3RfY29uZmlnKSkKKyAgICApOworICAgIGFzc2VydF9l
cSEoCisgICAgICAgIDo6c3RkOjptZW06OmFsaWduX29mOjo8Z3Bpb2RfbGluZV9yZXF1ZXN0X2Nv
bmZpZz4oKSwKKyAgICAgICAgOHVzaXplLAorICAgICAgICBjb25jYXQhKCJBbGlnbm1lbnQgb2Yg
Iiwgc3RyaW5naWZ5IShncGlvZF9saW5lX3JlcXVlc3RfY29uZmlnKSkKKyAgICApOworICAgIGFz
c2VydF9lcSEoCisgICAgICAgIHVuc2FmZSB7CisgICAgICAgICAgICAmKCooOjpzdGQ6OnB0cjo6
bnVsbDo6PGdwaW9kX2xpbmVfcmVxdWVzdF9jb25maWc+KCkpKS5jb25zdW1lciBhcyAqY29uc3Qg
XyBhcyB1c2l6ZQorICAgICAgICB9LAorICAgICAgICAwdXNpemUsCisgICAgICAgIGNvbmNhdCEo
CisgICAgICAgICAgICAiT2Zmc2V0IG9mIGZpZWxkOiAiLAorICAgICAgICAgICAgc3RyaW5naWZ5
IShncGlvZF9saW5lX3JlcXVlc3RfY29uZmlnKSwKKyAgICAgICAgICAgICI6OiIsCisgICAgICAg
ICAgICBzdHJpbmdpZnkhKGNvbnN1bWVyKQorICAgICAgICApCisgICAgKTsKKyAgICBhc3NlcnRf
ZXEhKAorICAgICAgICB1bnNhZmUgeworICAgICAgICAgICAgJigqKDo6c3RkOjpwdHI6Om51bGw6
OjxncGlvZF9saW5lX3JlcXVlc3RfY29uZmlnPigpKSkucmVxdWVzdF90eXBlIGFzICpjb25zdCBf
IGFzIHVzaXplCisgICAgICAgIH0sCisgICAgICAgIDh1c2l6ZSwKKyAgICAgICAgY29uY2F0ISgK
KyAgICAgICAgICAgICJPZmZzZXQgb2YgZmllbGQ6ICIsCisgICAgICAgICAgICBzdHJpbmdpZnkh
KGdwaW9kX2xpbmVfcmVxdWVzdF9jb25maWcpLAorICAgICAgICAgICAgIjo6IiwKKyAgICAgICAg
ICAgIHN0cmluZ2lmeSEocmVxdWVzdF90eXBlKQorICAgICAgICApCisgICAgKTsKKyAgICBhc3Nl
cnRfZXEhKAorICAgICAgICB1bnNhZmUgeyAmKCooOjpzdGQ6OnB0cjo6bnVsbDo6PGdwaW9kX2xp
bmVfcmVxdWVzdF9jb25maWc+KCkpKS5mbGFncyBhcyAqY29uc3QgXyBhcyB1c2l6ZSB9LAorICAg
ICAgICAxMnVzaXplLAorICAgICAgICBjb25jYXQhKAorICAgICAgICAgICAgIk9mZnNldCBvZiBm
aWVsZDogIiwKKyAgICAgICAgICAgIHN0cmluZ2lmeSEoZ3Bpb2RfbGluZV9yZXF1ZXN0X2NvbmZp
ZyksCisgICAgICAgICAgICAiOjoiLAorICAgICAgICAgICAgc3RyaW5naWZ5IShmbGFncykKKyAg
ICAgICAgKQorICAgICk7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfbGluZV9y
ZXF1ZXN0KAorICAgICAgICBsaW5lOiAqbXV0IGdwaW9kX2xpbmUsCisgICAgICAgIGNvbmZpZzog
KmNvbnN0IGdwaW9kX2xpbmVfcmVxdWVzdF9jb25maWcsCisgICAgICAgIGRlZmF1bHRfdmFsOiA6
OnN0ZDo6b3M6OnJhdzo6Y19pbnQsCisgICAgKSAtPiA6OnN0ZDo6b3M6OnJhdzo6Y19pbnQ7Cit9
CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfbGluZV9yZXF1ZXN0X2lucHV0KAorICAg
ICAgICBsaW5lOiAqbXV0IGdwaW9kX2xpbmUsCisgICAgICAgIGNvbnN1bWVyOiAqY29uc3QgOjpz
dGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30K
K2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX3JlcXVlc3Rfb3V0cHV0KAorICAg
ICAgICBsaW5lOiAqbXV0IGdwaW9kX2xpbmUsCisgICAgICAgIGNvbnN1bWVyOiAqY29uc3QgOjpz
dGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICAgICAgZGVmYXVsdF92YWw6IDo6c3RkOjpvczo6cmF3
OjpjX2ludCwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIg
eworICAgIHB1YiBmbiBncGlvZF9saW5lX3JlcXVlc3RfcmlzaW5nX2VkZ2VfZXZlbnRzKAorICAg
ICAgICBsaW5lOiAqbXV0IGdwaW9kX2xpbmUsCisgICAgICAgIGNvbnN1bWVyOiAqY29uc3QgOjpz
dGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30K
K2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX3JlcXVlc3RfZmFsbGluZ19lZGdl
X2V2ZW50cygKKyAgICAgICAgbGluZTogKm11dCBncGlvZF9saW5lLAorICAgICAgICBjb25zdW1l
cjogKmNvbnN0IDo6c3RkOjpvczo6cmF3OjpjX2NoYXIsCisgICAgKSAtPiA6OnN0ZDo6b3M6OnJh
dzo6Y19pbnQ7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfbGluZV9yZXF1ZXN0
X2JvdGhfZWRnZXNfZXZlbnRzKAorICAgICAgICBsaW5lOiAqbXV0IGdwaW9kX2xpbmUsCisgICAg
ICAgIGNvbnN1bWVyOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICApIC0+IDo6
c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9s
aW5lX3JlcXVlc3RfaW5wdXRfZmxhZ3MoCisgICAgICAgIGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwK
KyAgICAgICAgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19jaGFyLAorICAgICAg
ICBmbGFnczogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6
OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9v
dXRwdXRfZmxhZ3MoCisgICAgICAgIGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgY29u
c3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19jaGFyLAorICAgICAgICBmbGFnczogOjpz
dGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICAgICBkZWZhdWx0X3ZhbDogOjpzdGQ6Om9zOjpyYXc6
OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7
CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9yaXNpbmdfZWRnZV9ldmVudHNfZmxhZ3Mo
CisgICAgICAgIGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgY29uc3VtZXI6ICpjb25z
dCA6OnN0ZDo6b3M6OnJhdzo6Y19jaGFyLAorICAgICAgICBmbGFnczogOjpzdGQ6Om9zOjpyYXc6
OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7
CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9mYWxsaW5nX2VkZ2VfZXZlbnRzX2ZsYWdz
KAorICAgICAgICBsaW5lOiAqbXV0IGdwaW9kX2xpbmUsCisgICAgICAgIGNvbnN1bWVyOiAqY29u
c3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICAgICAgZmxhZ3M6IDo6c3RkOjpvczo6cmF3
OjpjX2ludCwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIg
eworICAgIHB1YiBmbiBncGlvZF9saW5lX3JlcXVlc3RfYm90aF9lZGdlc19ldmVudHNfZmxhZ3Mo
CisgICAgICAgIGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgY29uc3VtZXI6ICpjb25z
dCA6OnN0ZDo6b3M6OnJhdzo6Y19jaGFyLAorICAgICAgICBmbGFnczogOjpzdGQ6Om9zOjpyYXc6
OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7
CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxrKAorICAgICAgICBidWxrOiAqbXV0
IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgY29uZmlnOiAqY29uc3QgZ3Bpb2RfbGluZV9yZXF1
ZXN0X2NvbmZpZywKKyAgICAgICAgZGVmYXVsdF92YWxzOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6
OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7
CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxrX2lucHV0KAorICAgICAgICBidWxr
OiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6
b3M6OnJhdzo6Y19jaGFyLAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0
ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxrX291dHB1dCgKKyAg
ICAgICAgYnVsazogKm11dCBncGlvZF9saW5lX2J1bGssCisgICAgICAgIGNvbnN1bWVyOiAqY29u
c3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICAgICAgZGVmYXVsdF92YWxzOiAqY29uc3Qg
OjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50Owor
fQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxrX3Jpc2lu
Z19lZGdlX2V2ZW50cygKKyAgICAgICAgYnVsazogKm11dCBncGlvZF9saW5lX2J1bGssCisgICAg
ICAgIGNvbnN1bWVyOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICApIC0+IDo6
c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9s
aW5lX3JlcXVlc3RfYnVsa19mYWxsaW5nX2VkZ2VfZXZlbnRzKAorICAgICAgICBidWxrOiAqbXV0
IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6OnJh
dzo6Y19jaGFyLAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJD
IiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxrX2JvdGhfZWRnZXNfZXZlbnRz
KAorICAgICAgICBidWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgY29uc3VtZXI6
ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19jaGFyLAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6
OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9i
dWxrX2lucHV0X2ZsYWdzKAorICAgICAgICBidWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAg
ICAgICAgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19jaGFyLAorICAgICAgICBm
bGFnczogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNf
aW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxr
X291dHB1dF9mbGFncygKKyAgICAgICAgYnVsazogKm11dCBncGlvZF9saW5lX2J1bGssCisgICAg
ICAgIGNvbnN1bWVyOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICAgICAgZmxh
Z3M6IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICAgICAgZGVmYXVsdF92YWxzOiAqY29uc3Qg
OjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50Owor
fQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVxdWVzdF9idWxrX3Jpc2lu
Z19lZGdlX2V2ZW50c19mbGFncygKKyAgICAgICAgYnVsazogKm11dCBncGlvZF9saW5lX2J1bGss
CisgICAgICAgIGNvbnN1bWVyOiAqY29uc3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhciwKKyAgICAg
ICAgZmxhZ3M6IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3
OjpjX2ludDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX3JlcXVlc3Rf
YnVsa19mYWxsaW5nX2VkZ2VfZXZlbnRzX2ZsYWdzKAorICAgICAgICBidWxrOiAqbXV0IGdwaW9k
X2xpbmVfYnVsaywKKyAgICAgICAgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19j
aGFyLAorICAgICAgICBmbGFnczogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpz
dGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xp
bmVfcmVxdWVzdF9idWxrX2JvdGhfZWRnZXNfZXZlbnRzX2ZsYWdzKAorICAgICAgICBidWxrOiAq
bXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgY29uc3VtZXI6ICpjb25zdCA6OnN0ZDo6b3M6
OnJhdzo6Y19jaGFyLAorICAgICAgICBmbGFnczogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAg
ICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZu
IGdwaW9kX2xpbmVfcmVsZWFzZShsaW5lOiAqbXV0IGdwaW9kX2xpbmUpOworfQorZXh0ZXJuICJD
IiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfcmVsZWFzZV9idWxrKGJ1bGs6ICptdXQgZ3Bpb2Rf
bGluZV9idWxrKTsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2dldF92
YWx1ZShsaW5lOiAqbXV0IGdwaW9kX2xpbmUpIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30K
K2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2dldF92YWx1ZV9idWxrKAorICAg
ICAgICBidWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgdmFsdWVzOiAqbXV0IDo6
c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30K
K2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX3NldF92YWx1ZSgKKyAgICAgICAg
bGluZTogKm11dCBncGlvZF9saW5lLAorICAgICAgICB2YWx1ZTogOjpzdGQ6Om9zOjpyYXc6OmNf
aW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7Cisg
ICAgcHViIGZuIGdwaW9kX2xpbmVfc2V0X3ZhbHVlX2J1bGsoCisgICAgICAgIGJ1bGs6ICptdXQg
Z3Bpb2RfbGluZV9idWxrLAorICAgICAgICB2YWx1ZXM6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6
Y19pbnQsCisgICAgKSAtPiA6OnN0ZDo6b3M6OnJhdzo6Y19pbnQ7Cit9CitleHRlcm4gIkMiIHsK
KyAgICBwdWIgZm4gZ3Bpb2RfbGluZV9zZXRfY29uZmlnKAorICAgICAgICBsaW5lOiAqbXV0IGdw
aW9kX2xpbmUsCisgICAgICAgIGRpcmVjdGlvbjogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAg
ICAgICBmbGFnczogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICAgICB2YWx1ZTogOjpzdGQ6
Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0
ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfc2V0X2NvbmZpZ19idWxrKAorICAgICAg
ICBidWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICAgICAgZGlyZWN0aW9uOiA6OnN0ZDo6
b3M6OnJhdzo6Y19pbnQsCisgICAgICAgIGZsYWdzOiA6OnN0ZDo6b3M6OnJhdzo6Y19pbnQsCisg
ICAgICAgIHZhbHVlczogKmNvbnN0IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICApIC0+IDo6
c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9s
aW5lX3NldF9mbGFncygKKyAgICAgICAgbGluZTogKm11dCBncGlvZF9saW5lLAorICAgICAgICBm
bGFnczogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNf
aW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfc2V0X2ZsYWdzX2J1
bGsoCisgICAgICAgIGJ1bGs6ICptdXQgZ3Bpb2RfbGluZV9idWxrLAorICAgICAgICBmbGFnczog
OjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50Owor
fQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfc2V0X2RpcmVjdGlvbl9pbnB1
dChsaW5lOiAqbXV0IGdwaW9kX2xpbmUpIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4
dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX3NldF9kaXJlY3Rpb25faW5wdXRfYnVs
ayhidWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaykKKyAgICAgICAgLT4gOjpzdGQ6Om9zOjpyYXc6
OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfc2V0X2RpcmVj
dGlvbl9vdXRwdXQoCisgICAgICAgIGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgdmFs
dWU6IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2lu
dDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX3NldF9kaXJlY3Rpb25f
b3V0cHV0X2J1bGsoCisgICAgICAgIGJ1bGs6ICptdXQgZ3Bpb2RfbGluZV9idWxrLAorICAgICAg
ICB2YWx1ZXM6ICpjb25zdCA6OnN0ZDo6b3M6OnJhdzo6Y19pbnQsCisgICAgKSAtPiA6OnN0ZDo6
b3M6OnJhdzo6Y19pbnQ7Cit9CitwdWIgY29uc3QgR1BJT0RfTElORV9FVkVOVF9SSVNJTkdfRURH
RTogOjpzdGQ6Om9zOjpyYXc6OmNfdWludCA9IDE7CitwdWIgY29uc3QgR1BJT0RfTElORV9FVkVO
VF9GQUxMSU5HX0VER0U6IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQgPSAyOworcHViIHR5cGUgX2Jp
bmRnZW5fdHlfNyA9IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQ7CisjW3JlcHIoQyldCisjW2Rlcml2
ZShEZWJ1ZywgQ29weSwgQ2xvbmUpXQorcHViIHN0cnVjdCBncGlvZF9saW5lX2V2ZW50IHsKKyAg
ICBwdWIgdHM6IHRpbWVzcGVjLAorICAgIHB1YiBldmVudF90eXBlOiA6OnN0ZDo6b3M6OnJhdzo6
Y19pbnQsCisgICAgcHViIG9mZnNldDogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorfQorI1t0ZXN0
XQorZm4gYmluZGdlbl90ZXN0X2xheW91dF9ncGlvZF9saW5lX2V2ZW50KCkgeworICAgIGFzc2Vy
dF9lcSEoCisgICAgICAgIDo6c3RkOjptZW06OnNpemVfb2Y6OjxncGlvZF9saW5lX2V2ZW50Pigp
LAorICAgICAgICAyNHVzaXplLAorICAgICAgICBjb25jYXQhKCJTaXplIG9mOiAiLCBzdHJpbmdp
ZnkhKGdwaW9kX2xpbmVfZXZlbnQpKQorICAgICk7CisgICAgYXNzZXJ0X2VxISgKKyAgICAgICAg
OjpzdGQ6Om1lbTo6YWxpZ25fb2Y6OjxncGlvZF9saW5lX2V2ZW50PigpLAorICAgICAgICA4dXNp
emUsCisgICAgICAgIGNvbmNhdCEoIkFsaWdubWVudCBvZiAiLCBzdHJpbmdpZnkhKGdwaW9kX2xp
bmVfZXZlbnQpKQorICAgICk7CisgICAgYXNzZXJ0X2VxISgKKyAgICAgICAgdW5zYWZlIHsgJigq
KDo6c3RkOjpwdHI6Om51bGw6OjxncGlvZF9saW5lX2V2ZW50PigpKSkudHMgYXMgKmNvbnN0IF8g
YXMgdXNpemUgfSwKKyAgICAgICAgMHVzaXplLAorICAgICAgICBjb25jYXQhKAorICAgICAgICAg
ICAgIk9mZnNldCBvZiBmaWVsZDogIiwKKyAgICAgICAgICAgIHN0cmluZ2lmeSEoZ3Bpb2RfbGlu
ZV9ldmVudCksCisgICAgICAgICAgICAiOjoiLAorICAgICAgICAgICAgc3RyaW5naWZ5ISh0cykK
KyAgICAgICAgKQorICAgICk7CisgICAgYXNzZXJ0X2VxISgKKyAgICAgICAgdW5zYWZlIHsgJigq
KDo6c3RkOjpwdHI6Om51bGw6OjxncGlvZF9saW5lX2V2ZW50PigpKSkuZXZlbnRfdHlwZSBhcyAq
Y29uc3QgXyBhcyB1c2l6ZSB9LAorICAgICAgICAxNnVzaXplLAorICAgICAgICBjb25jYXQhKAor
ICAgICAgICAgICAgIk9mZnNldCBvZiBmaWVsZDogIiwKKyAgICAgICAgICAgIHN0cmluZ2lmeSEo
Z3Bpb2RfbGluZV9ldmVudCksCisgICAgICAgICAgICAiOjoiLAorICAgICAgICAgICAgc3RyaW5n
aWZ5IShldmVudF90eXBlKQorICAgICAgICApCisgICAgKTsKKyAgICBhc3NlcnRfZXEhKAorICAg
ICAgICB1bnNhZmUgeyAmKCooOjpzdGQ6OnB0cjo6bnVsbDo6PGdwaW9kX2xpbmVfZXZlbnQ+KCkp
KS5vZmZzZXQgYXMgKmNvbnN0IF8gYXMgdXNpemUgfSwKKyAgICAgICAgMjB1c2l6ZSwKKyAgICAg
ICAgY29uY2F0ISgKKyAgICAgICAgICAgICJPZmZzZXQgb2YgZmllbGQ6ICIsCisgICAgICAgICAg
ICBzdHJpbmdpZnkhKGdwaW9kX2xpbmVfZXZlbnQpLAorICAgICAgICAgICAgIjo6IiwKKyAgICAg
ICAgICAgIHN0cmluZ2lmeSEob2Zmc2V0KQorICAgICAgICApCisgICAgKTsKK30KK2V4dGVybiAi
QyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2V2ZW50X3dhaXQoCisgICAgICAgIGxpbmU6ICpt
dXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgdGltZW91dDogKmNvbnN0IHRpbWVzcGVjLAorICAgICkg
LT4gOjpzdGQ6Om9zOjpyYXc6OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdw
aW9kX2xpbmVfZXZlbnRfd2FpdF9idWxrKAorICAgICAgICBidWxrOiAqbXV0IGdwaW9kX2xpbmVf
YnVsaywKKyAgICAgICAgdGltZW91dDogKmNvbnN0IHRpbWVzcGVjLAorICAgICAgICBldmVudF9i
dWxrOiAqbXV0IGdwaW9kX2xpbmVfYnVsaywKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2lu
dDsKK30KK2V4dGVybiAiQyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2V2ZW50X3JlYWQoCisg
ICAgICAgIGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgZXZlbnQ6ICptdXQgZ3Bpb2Rf
bGluZV9ldmVudCwKKyAgICApIC0+IDo6c3RkOjpvczo6cmF3OjpjX2ludDsKK30KK2V4dGVybiAi
QyIgeworICAgIHB1YiBmbiBncGlvZF9saW5lX2V2ZW50X3JlYWRfbXVsdGlwbGUoCisgICAgICAg
IGxpbmU6ICptdXQgZ3Bpb2RfbGluZSwKKyAgICAgICAgZXZlbnRzOiAqbXV0IGdwaW9kX2xpbmVf
ZXZlbnQsCisgICAgICAgIG51bV9ldmVudHM6IDo6c3RkOjpvczo6cmF3OjpjX3VpbnQsCisgICAg
KSAtPiA6OnN0ZDo6b3M6OnJhdzo6Y19pbnQ7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4g
Z3Bpb2RfbGluZV9ldmVudF9nZXRfZmQobGluZTogKm11dCBncGlvZF9saW5lKSAtPiA6OnN0ZDo6
b3M6OnJhdzo6Y19pbnQ7Cit9CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfbGluZV9l
dmVudF9yZWFkX2ZkKAorICAgICAgICBmZDogOjpzdGQ6Om9zOjpyYXc6OmNfaW50LAorICAgICAg
ICBldmVudDogKm11dCBncGlvZF9saW5lX2V2ZW50LAorICAgICkgLT4gOjpzdGQ6Om9zOjpyYXc6
OmNfaW50OworfQorZXh0ZXJuICJDIiB7CisgICAgcHViIGZuIGdwaW9kX2xpbmVfZXZlbnRfcmVh
ZF9mZF9tdWx0aXBsZSgKKyAgICAgICAgZmQ6IDo6c3RkOjpvczo6cmF3OjpjX2ludCwKKyAgICAg
ICAgZXZlbnRzOiAqbXV0IGdwaW9kX2xpbmVfZXZlbnQsCisgICAgICAgIG51bV9ldmVudHM6IDo6
c3RkOjpvczo6cmF3OjpjX3VpbnQsCisgICAgKSAtPiA6OnN0ZDo6b3M6OnJhdzo6Y19pbnQ7Cit9
CitleHRlcm4gIkMiIHsKKyAgICBwdWIgZm4gZ3Bpb2RfdmVyc2lvbl9zdHJpbmcoKSAtPiAqY29u
c3QgOjpzdGQ6Om9zOjpyYXc6OmNfY2hhcjsKK30KKworI1tjZmcodGVzdCldCittb2QgdGVzdHMg
eworICAgIHVzZSBzdXBlcjo6KjsKKworICAgICNbdGVzdF0KKyAgICBmbiBsaW5rX2NoZWNrKCkg
eworICAgICAgICB1c2Ugc3RkOjpmZmk6OkNTdHI7CisKKyAgICAgICAgYXNzZXJ0ISghdW5zYWZl
IHsgQ1N0cjo6ZnJvbV9wdHIoZ3Bpb2RfdmVyc2lvbl9zdHJpbmcoKSkgfQorICAgICAgICAgICAg
LnRvX3N0cmluZ19sb3NzeSgpCisgICAgICAgICAgICAuaXNfZW1wdHkoKSk7CisgICAgfQorfQot
LSAKMi4zNC4xCgo=
--000000000000c8ef4305d33f994b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Added-libgpiod-FFI-bindings-generation-crate.patch"
Content-Disposition: attachment; 
	filename="0001-Added-libgpiod-FFI-bindings-generation-crate.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kx8q1oq50>
X-Attachment-Id: f_kx8q1oq50

RnJvbSAyNWQ4YWJlOTk5Nzc0NzQ5MWQ0ZTQxNzhlZmFlYzExNmI4MTFmNjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHZXJhcmQgUnlhbiA8Ry5NME4zWS4yNTAzQGdtYWlsLmNvbT4K
RGF0ZTogU2F0LCA2IE5vdiAyMDIxIDIxOjIzOjAxICsxMDAwClN1YmplY3Q6IFtQQVRDSCAxLzJd
IEFkZGVkIGxpYmdwaW9kIEZGSSBiaW5kaW5ncyBnZW5lcmF0aW9uIGNyYXRlCgpTaWduZWQtb2Zm
LWJ5OiBHZXJhcmQgUnlhbiA8Ry5NME4zWS4yNTAzQGdtYWlsLmNvbT4KLS0tCiBiaW5kaW5ncy9y
dXN0Ly5naXRpZ25vcmUgICAgICAgICAgICAgIHwgICAxICsKIGJpbmRpbmdzL3J1c3QvQ2FyZ28u
bG9jayAgICAgICAgICAgICAgfCAzODIgKysrKysrKysrKysrKysrKysrKysrKysrKysKIGJpbmRp
bmdzL3J1c3QvQ2FyZ28udG9tbCAgICAgICAgICAgICAgfCAgIDIgKwogYmluZGluZ3MvcnVzdC9s
aWJncGlvZC1zeXMvQ2FyZ28udG9tbCB8ICAxNCArCiBiaW5kaW5ncy9ydXN0L2xpYmdwaW9kLXN5
cy9SRUFETUUubWQgIHwgICA3ICsKIGJpbmRpbmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL2J1aWxkLnJz
ICAgfCAxNjYgKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgNTcyIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBiaW5kaW5ncy9ydXN0Ly5naXRpZ25vcmUKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBiaW5kaW5ncy9ydXN0L0NhcmdvLmxvY2sKIGNyZWF0ZSBtb2RlIDEwMDY0NCBiaW5k
aW5ncy9ydXN0L0NhcmdvLnRvbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBiaW5kaW5ncy9ydXN0L2xp
YmdwaW9kLXN5cy9DYXJnby50b21sCiBjcmVhdGUgbW9kZSAxMDA2NDQgYmluZGluZ3MvcnVzdC9s
aWJncGlvZC1zeXMvUkVBRE1FLm1kCiBjcmVhdGUgbW9kZSAxMDA2NDQgYmluZGluZ3MvcnVzdC9s
aWJncGlvZC1zeXMvYnVpbGQucnMKCmRpZmYgLS1naXQgYS9iaW5kaW5ncy9ydXN0Ly5naXRpZ25v
cmUgYi9iaW5kaW5ncy9ydXN0Ly5naXRpZ25vcmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMC4uMmY3ODk2ZAotLS0gL2Rldi9udWxsCisrKyBiL2JpbmRpbmdzL3J1c3QvLmdpdGln
bm9yZQpAQCAtMCwwICsxIEBACit0YXJnZXQvCmRpZmYgLS1naXQgYS9iaW5kaW5ncy9ydXN0L0Nh
cmdvLmxvY2sgYi9iaW5kaW5ncy9ydXN0L0NhcmdvLmxvY2sKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMC4uMDI0M2IxYgotLS0gL2Rldi9udWxsCisrKyBiL2JpbmRpbmdzL3J1c3Qv
Q2FyZ28ubG9jawpAQCAtMCwwICsxLDM4MiBAQAorIyBUaGlzIGZpbGUgaXMgYXV0b21hdGljYWxs
eSBAZ2VuZXJhdGVkIGJ5IENhcmdvLgorIyBJdCBpcyBub3QgaW50ZW5kZWQgZm9yIG1hbnVhbCBl
ZGl0aW5nLgordmVyc2lvbiA9IDMKKworW1twYWNrYWdlXV0KK25hbWUgPSAiYWhvLWNvcmFzaWNr
IgordmVyc2lvbiA9ICIwLjcuMTUiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIu
Y29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICI3NDA0ZmViZmZhYTQ3
ZGFjODFhYTQ0ZGJhNzE1MjNjOWQwNjliMWJkYzUwYTc3ZGI0MTE5NTE0OWUxN2Y2OGU1IgorZGVw
ZW5kZW5jaWVzID0gWworICJtZW1jaHIiLAorXQorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJhbnNp
X3Rlcm0iCit2ZXJzaW9uID0gIjAuMTEuMCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dp
dGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gImVlNDliYWY2
Y2I2MTdiODUzYWE4ZDkzYmY0MjBkYjIzODNmYWI0NmQzMTQ0ODJjYTI4MDNiNDBkNWZkZTk3OWIi
CitkZXBlbmRlbmNpZXMgPSBbCisgIndpbmFwaSIsCitdCisKK1tbcGFja2FnZV1dCituYW1lID0g
ImF0dHkiCit2ZXJzaW9uID0gIjAuMi4xNCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dp
dGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gImQ5YjM5YmUx
ODc3MGQxMTQyMWNkYjFiOTk0N2E0NWRkM2YzN2U5MzA5MmNiZjM3NzYxNDgyOGEzMTlkNWZlZTgi
CitkZXBlbmRlbmNpZXMgPSBbCisgImhlcm1pdC1hYmkiLAorICJsaWJjIiwKKyAid2luYXBpIiwK
K10KKworW1twYWNrYWdlXV0KK25hbWUgPSAiYmluZGdlbiIKK3ZlcnNpb24gPSAiMC41OS4xIgor
c291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlv
LWluZGV4IgorY2hlY2tzdW0gPSAiNDUzYzQ5ZTU5NTBiYjBlYjYzYmIzZGY2NDBlMzE2MTg4NDZj
ODlkNWI3ZmFhNTQwNDBkNzZlOThlMDEzNDM3NSIKK2RlcGVuZGVuY2llcyA9IFsKKyAiYml0Zmxh
Z3MiLAorICJjZXhwciIsCisgImNsYW5nLXN5cyIsCisgImNsYXAiLAorICJlbnZfbG9nZ2VyIiwK
KyAibGF6eV9zdGF0aWMiLAorICJsYXp5Y2VsbCIsCisgImxvZyIsCisgInBlZWtpbmdfdGFrZV93
aGlsZSIsCisgInByb2MtbWFjcm8yIiwKKyAicXVvdGUiLAorICJyZWdleCIsCisgInJ1c3RjLWhh
c2giLAorICJzaGxleCIsCisgIndoaWNoIiwKK10KKworW1twYWNrYWdlXV0KK25hbWUgPSAiYml0
ZmxhZ3MiCit2ZXJzaW9uID0gIjEuMy4yIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0
aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiYmVmMzhkNDUx
NjNjMmYxZGRlMDk0YTdkZmQzM2NjZjU5NWM5MjkwNWM4ZjhmNGZkYzE4ZDA2ZmIxMDM3NzE4YSIK
KworW1twYWNrYWdlXV0KK25hbWUgPSAiYml0dmVjIgordmVyc2lvbiA9ICIwLjE5LjUiCitzb3Vy
Y2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5k
ZXgiCitjaGVja3N1bSA9ICI4OTQyYzhkMzUyYWUxODM4YzlkZGEwYjBjYTJhYjY1NzY5NmVmMjIz
MmEyMDE0N2NmMWIzMGFlMWE5Y2I0MzIxIgorZGVwZW5kZW5jaWVzID0gWworICJmdW50eSIsCisg
InJhZGl1bSIsCisgInRhcCIsCisgInd5eiIsCitdCisKK1tbcGFja2FnZV1dCituYW1lID0gImNl
eHByIgordmVyc2lvbiA9ICIwLjUuMCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1
Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gImRiNTA3YTc2Nzky
NTJkMjI3NmVkMGRkODExM2M2ODc1ZWM1NmQzMDg5ZjkyMjViMmI0MmMzMGNjMWY4ZTVjODkiCitk
ZXBlbmRlbmNpZXMgPSBbCisgIm5vbSIsCitdCisKK1tbcGFja2FnZV1dCituYW1lID0gImNmZy1p
ZiIKK3ZlcnNpb24gPSAiMS4wLjAiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIu
Y29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICJiYWYxZGU0MzM5NzYx
NTg4YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0ZWZiZjc5MTE3YmQyZGE0MGZkIgorCitb
W3BhY2thZ2VdXQorbmFtZSA9ICJjbGFuZy1zeXMiCit2ZXJzaW9uID0gIjEuMy4wIgorc291cmNl
ID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4
IgorY2hlY2tzdW0gPSAiZmE2NjA0NWI5Y2IyM2MyZTljMTUyMDczMjAzMDYwOGIwMmVlMDdlNWNm
YWE1YTUyMWVjMTVkZWQ3ZmEyNGM5MCIKK2RlcGVuZGVuY2llcyA9IFsKKyAiZ2xvYiIsCisgImxp
YmMiLAorICJsaWJsb2FkaW5nIiwKK10KKworW1twYWNrYWdlXV0KK25hbWUgPSAiY2xhcCIKK3Zl
cnNpb24gPSAiMi4zMy4zIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9y
dXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiMzdlNThhYzc4NTczYzQwNzA4
ZDQ1NTIyZjBkODBmYTJmMDFjYzRmOWI0ZTJiZjc0OTgwNzI1NTQ1NDMxMjAwMiIKK2RlcGVuZGVu
Y2llcyA9IFsKKyAiYW5zaV90ZXJtIiwKKyAiYXR0eSIsCisgImJpdGZsYWdzIiwKKyAic3Ryc2lt
IiwKKyAidGV4dHdyYXAiLAorICJ1bmljb2RlLXdpZHRoIiwKKyAidmVjX21hcCIsCitdCisKK1tb
cGFja2FnZV1dCituYW1lID0gImVudl9sb2dnZXIiCit2ZXJzaW9uID0gIjAuOC40Igorc291cmNl
ID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4
IgorY2hlY2tzdW0gPSAiYTE5MTg3ZmVhM2FjN2U4NGRhN2RhY2Y0OGRlMGM0NWQ2M2M2YTc2Zjk0
OTBkYWUzODlhZWFkMTZjMjQzZmNlMyIKK2RlcGVuZGVuY2llcyA9IFsKKyAiYXR0eSIsCisgImh1
bWFudGltZSIsCisgImxvZyIsCisgInJlZ2V4IiwKKyAidGVybWNvbG9yIiwKK10KKworW1twYWNr
YWdlXV0KK25hbWUgPSAiZnVudHkiCit2ZXJzaW9uID0gIjEuMS4wIgorc291cmNlID0gInJlZ2lz
dHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tz
dW0gPSAiZmVkMzRjZDEwNTkxN2U5MWRhYTRkYTZiMzcyOGM0N2IwNjg3NDlkNmE2MmM1OTgxMWYw
NmVkMmFjNzFkOWRhNyIKKworW1twYWNrYWdlXV0KK25hbWUgPSAiZ2xvYiIKK3ZlcnNpb24gPSAi
MC4zLjAiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9j
cmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICI5YjkxOTkzM2EzOTdiNzljMzdlMzNiNzdiYjJh
YTNkYzhlYjZlMTY1YWQ4MDllNThmZjc1YmM3ZGIyZTM0NTc0IgorCitbW3BhY2thZ2VdXQorbmFt
ZSA9ICJoZXJtaXQtYWJpIgordmVyc2lvbiA9ICIwLjEuMTkiCitzb3VyY2UgPSAicmVnaXN0cnkr
aHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9
ICI2MmI0NjczNDNiOTRiYTQ3NmRjYjI1MDBkMjQyZGFkYmIzOTU1N2RmODg5MzEwYWM3N2M1ZDk5
MTAwYWFhYzMzIgorZGVwZW5kZW5jaWVzID0gWworICJsaWJjIiwKK10KKworW1twYWNrYWdlXV0K
K25hbWUgPSAiaHVtYW50aW1lIgordmVyc2lvbiA9ICIyLjEuMCIKK3NvdXJjZSA9ICJyZWdpc3Ry
eStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3Vt
ID0gIjlhM2E1YmZiMTk1OTMxZWViMzM2YjJhN2I0ZDc2MWRhZWM4NDFiOTdmOTQ3ZDM0Mzk0NjAx
NzM3YTdiYmE1ZTQiCisKK1tbcGFja2FnZV1dCituYW1lID0gImxhenlfc3RhdGljIgordmVyc2lv
biA9ICIxLjQuMCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1s
YW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gImUyYWJhZDIzZmJjNDJiMzcwMGYyZjI3
OTg0NGRjODMyYWRiMmIyZWIwNjliMmRmOTE4ZjQ1NWM0ZTE4Y2M2NDYiCisKK1tbcGFja2FnZV1d
CituYW1lID0gImxhenljZWxsIgordmVyc2lvbiA9ICIxLjMuMCIKK3NvdXJjZSA9ICJyZWdpc3Ry
eStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3Vt
ID0gIjgzMGQwOGNlMWQxZDk0MWU2YjMwNjQ1ZjFhMGViNTY0MzAxM2Q4MzVjZTM3NzlhNWZjMjA4
MjYxZGJlMTBmNTUiCisKK1tbcGFja2FnZV1dCituYW1lID0gImxpYmMiCit2ZXJzaW9uID0gIjAu
Mi4xMDYiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9j
cmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICJhNjA1NTNmOWE5ZTAzOWEzMzNiNGU5YjIwNTcz
YjllOWI5YzBiYjNhMTFlMjAxY2NjNDhlZjQyODM0NTZkNjczIgorCitbW3BhY2thZ2VdXQorbmFt
ZSA9ICJsaWJncGlvZC1zeXMiCit2ZXJzaW9uID0gIjAuMS4wIgorZGVwZW5kZW5jaWVzID0gWwor
ICJiaW5kZ2VuIiwKKyAicGtnLWNvbmZpZyIsCitdCisKK1tbcGFja2FnZV1dCituYW1lID0gImxp
YmxvYWRpbmciCit2ZXJzaW9uID0gIjAuNy4xIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8v
Z2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiYzBjZjAz
NmQxNTQwMmJlYTNjNWQ0ZGUxN2IzZmNlNzZiM2U0YTU2ZWJjMWY1NzdiZTBlN2E3MmY3YzYwN2Nm
MCIKK2RlcGVuZGVuY2llcyA9IFsKKyAiY2ZnLWlmIiwKKyAid2luYXBpIiwKK10KKworW1twYWNr
YWdlXV0KK25hbWUgPSAibG9nIgordmVyc2lvbiA9ICIwLjQuMTQiCitzb3VyY2UgPSAicmVnaXN0
cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1
bSA9ICI1MWI5YmJlNmM0N2Q1MWZjM2UxYTliOTQ1OTY1OTQ2YjRjNDQxNDJhYjg3OTJjNTA4MzVh
OTgwZDM2MmMyNzEwIgorZGVwZW5kZW5jaWVzID0gWworICJjZmctaWYiLAorXQorCitbW3BhY2th
Z2VdXQorbmFtZSA9ICJtZW1jaHIiCit2ZXJzaW9uID0gIjIuMy40Igorc291cmNlID0gInJlZ2lz
dHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tz
dW0gPSAiMGVlMWM0N2FhYTI1NmVjYWJjYWVhMzUxZWFlNGE5YjAxZWYzOWVkODEwMDA0ZTI5OGQy
NTExZWQyODRiMTUyNSIKKworW1twYWNrYWdlXV0KK25hbWUgPSAibm9tIgordmVyc2lvbiA9ICI2
LjIuMSIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2Ny
YXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gIjljNWM1MWI5MDgzYTNjNjIwZmE2N2EyYTYzNWQx
Y2U3ZDk1Yjg5N2U5NTdkNmIyOGZmOWE1ZGE5NjBhMTAzYTYiCitkZXBlbmRlbmNpZXMgPSBbCisg
ImJpdHZlYyIsCisgImZ1bnR5IiwKKyAibWVtY2hyIiwKKyAidmVyc2lvbl9jaGVjayIsCitdCisK
K1tbcGFja2FnZV1dCituYW1lID0gInBlZWtpbmdfdGFrZV93aGlsZSIKK3ZlcnNpb24gPSAiMC4x
LjIiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0
ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICIxOWIxN2NkZGJlN2VjM2Y4YmM4MDA4ODdiYWI1ZTcx
NzM0OGM5NWVhMmNhMGIxYmYwODM3ZmI5NjRkYzY3MDk5IgorCitbW3BhY2thZ2VdXQorbmFtZSA9
ICJwa2ctY29uZmlnIgordmVyc2lvbiA9ICIwLjMuMjIiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0
cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICIx
MjI5NWRmNGYyOTQ0NzEyNDg1ODFiYzA5YmVmM2MzOGE1ZTQ2ZjFlMzZkNmEzNzM1MzYyMWEwYzZj
MzU3ZTFmIgorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJwcm9jLW1hY3JvMiIKK3ZlcnNpb24gPSAi
MS4wLjMyIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcv
Y3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiYmE1MDhjYzExNzQyYzBkYzVjMTY1OTc3MTY3
M2FmYmFiN2EwZWZhYjIzYWExN2U4NTRjYmFiMDgzN2VkMGI0MyIKK2RlcGVuZGVuY2llcyA9IFsK
KyAidW5pY29kZS14aWQiLAorXQorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJxdW90ZSIKK3ZlcnNp
b24gPSAiMS4wLjEwIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0
LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiMzhiYzhjYzZhNWYyZTM2NTVlMDg5
OWMxYjg0ODY0M2IyNTYyZjg1M2YxMTRiZmVjN2JlMTIwNjc4ZTNhY2UwNSIKK2RlcGVuZGVuY2ll
cyA9IFsKKyAicHJvYy1tYWNybzIiLAorXQorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJyYWRpdW0i
Cit2ZXJzaW9uID0gIjAuNS4zIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNv
bS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiOTQxYmE5ZDc4ZDhlMmY3
Y2U0NzRjMDE1ZWVhNGQ5YzZkMjViNmEzMzI3Zjk4MzJlZTI5YTRkZTI3ZjkxYmJiOCIKKworW1tw
YWNrYWdlXV0KK25hbWUgPSAicmVnZXgiCit2ZXJzaW9uID0gIjEuNC42Igorc291cmNlID0gInJl
Z2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hl
Y2tzdW0gPSAiMmEyNmFmNDE4YjU3NGJkNTY1ODgzMzViM2EzNjU5YTY1NzI1ZDRlNjM2ZWIxMDE2
YzJmOWUzYjM4YzdjYzc1OSIKK2RlcGVuZGVuY2llcyA9IFsKKyAiYWhvLWNvcmFzaWNrIiwKKyAi
bWVtY2hyIiwKKyAicmVnZXgtc3ludGF4IiwKK10KKworW1twYWNrYWdlXV0KK25hbWUgPSAicmVn
ZXgtc3ludGF4IgordmVyc2lvbiA9ICIwLjYuMjUiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6
Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICJmNDk3
Mjg1ODg0ZjNmY2ZmNDI0ZmZjOTMzZTU2ZDdjYmNhNTExZGVmMGM5ODMxYTdmOWI1ZjYxNTNlM2Nj
ODliIgorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJydXN0Yy1oYXNoIgordmVyc2lvbiA9ICIxLjEu
MCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRl
cy5pby1pbmRleCIKK2NoZWNrc3VtID0gIjA4ZDQzZjdhYTZiMDhkNDlmMzgyY2RlNmE3OTgyMDQ3
YzM0MjZkYjk0OWIxNDI0YmM0YjdlYzlhZTEyYzZjZTIiCisKK1tbcGFja2FnZV1dCituYW1lID0g
InNobGV4IgordmVyc2lvbiA9ICIxLjEuMCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dp
dGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gIjQzYjI4NTNh
NGQwOWYyMTVjMjRjYzU0ODljOTkyY2U0NjA1MmQzNTliNTEwOTM0M2NiYWZiZjI2YmM2MmY4YTMi
CisKK1tbcGFja2FnZV1dCituYW1lID0gInN0cnNpbSIKK3ZlcnNpb24gPSAiMC44LjAiCitzb3Vy
Y2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5k
ZXgiCitjaGVja3N1bSA9ICI4ZWE1MTE5Y2RiNGM1NWI1NWQ0MzJhYmI1MTNhMDQyOTM4NDg3OGMx
NWRkZTYwY2M3N2IxYzk5ZGUxYTk1YTZhIgorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJ0YXAiCit2
ZXJzaW9uID0gIjEuMC4xIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9y
dXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiNTU5MzdlMTc5OTE4NWIxMjg2
M2Q0NDdmNDI1OTdlZDY5ZDk5Mjg2ODZiOGQ4OGExZGYxNzM3NmEwOTdkODM2OSIKKworW1twYWNr
YWdlXV0KK25hbWUgPSAidGVybWNvbG9yIgordmVyc2lvbiA9ICIxLjEuMiIKK3NvdXJjZSA9ICJy
ZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2No
ZWNrc3VtID0gIjJkZmVkODk5ZjBlYjAzZjMyZWU4YzZhMGFhYmRiOGE3OTQ5NjU5ZTM0NjY1NjFm
YzBhZGY1NGUyNmQ4OGM1ZjQiCitkZXBlbmRlbmNpZXMgPSBbCisgIndpbmFwaS11dGlsIiwKK10K
KworW1twYWNrYWdlXV0KK25hbWUgPSAidGV4dHdyYXAiCit2ZXJzaW9uID0gIjAuMTEuMCIKK3Nv
dXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1p
bmRleCIKK2NoZWNrc3VtID0gImQzMjY2MTBmNDA4YzdhNGViNmY1MWMzN2MzMzBlNDk2YjA4NTA2
Yzk0NTdjOWQzNDI4N2VjYzM4ODA5ZmIwNjAiCitkZXBlbmRlbmNpZXMgPSBbCisgInVuaWNvZGUt
d2lkdGgiLAorXQorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJ1bmljb2RlLXdpZHRoIgordmVyc2lv
biA9ICIwLjEuOSIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1s
YW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gIjNlZDc0MmQ0ZWEyYmQxMTc2ZTIzNjE3
MmM4NDI5YWFmNTQ0ODZlN2FjMDk4ZGIyOWZmZTY1MjllMGNlNTA5NzMiCisKK1tbcGFja2FnZV1d
CituYW1lID0gInVuaWNvZGUteGlkIgordmVyc2lvbiA9ICIwLjIuMiIKK3NvdXJjZSA9ICJyZWdp
c3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNr
c3VtID0gIjhjY2I4MmQ2MWY4MGE2NjNlZmUxZjc4N2E1MWIxNmI1YTUxZTMzMTRkNmFjMzY1YjA4
NjM5ZjUyMzg3YjMzZjMiCisKK1tbcGFja2FnZV1dCituYW1lID0gInZlY19tYXAiCit2ZXJzaW9u
ID0gIjAuOC4yIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxh
bmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiZjFiZGRmMTE4N2JlNjkyZTc5YzVmZmVh
Yjg5MTEzMmRmYjBmMjM2ZWQzNmE0M2M3ZWQzOWYxMTY1ZWUyMDE5MSIKKworW1twYWNrYWdlXV0K
K25hbWUgPSAidmVyc2lvbl9jaGVjayIKK3ZlcnNpb24gPSAiMC45LjMiCitzb3VyY2UgPSAicmVn
aXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8taW5kZXgiCitjaGVj
a3N1bSA9ICI1ZmVjZGNhOWE1MjkxY2MyYjhkY2Y3ZGMwMjQ1M2ZlZTc5MWEyODBmMzc0M2NiMDkw
NWY4ODIyYWU0NjNiM2ZlIgorCitbW3BhY2thZ2VdXQorbmFtZSA9ICJ3aGljaCIKK3ZlcnNpb24g
PSAiMy4xLjEiCitzb3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFu
Zy9jcmF0ZXMuaW8taW5kZXgiCitjaGVja3N1bSA9ICJkMDExMDcxYWUxNGEyZjY2NzFkMGI3NDA4
MGFlMGNkOGViZjNhNmY4Yzk1ODlhMmNkNDVmMjMxMjZmZTI5NzI0IgorZGVwZW5kZW5jaWVzID0g
WworICJsaWJjIiwKK10KKworW1twYWNrYWdlXV0KK25hbWUgPSAid2luYXBpIgordmVyc2lvbiA9
ICIwLjMuOSIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5n
L2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gIjVjODM5YTY3NGZjZDdhOTg5NTJlNTkzMjQy
ZWE0MDBhYmU5Mzk5Mjc0Njc2MWUzODY0MTQwNWQyOGIwMGY0MTkiCitkZXBlbmRlbmNpZXMgPSBb
CisgIndpbmFwaS1pNjg2LXBjLXdpbmRvd3MtZ251IiwKKyAid2luYXBpLXg4Nl82NC1wYy13aW5k
b3dzLWdudSIsCitdCisKK1tbcGFja2FnZV1dCituYW1lID0gIndpbmFwaS1pNjg2LXBjLXdpbmRv
d3MtZ251IgordmVyc2lvbiA9ICIwLjQuMCIKK3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dp
dGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2NoZWNrc3VtID0gImFjM2I4N2M2
MzYyMDQyNmRkOWI5OTFlNWNlMDMyOWVmZjU0NWJjY2JiYjM0ZjNiZTA5ZmY2ZmI2YWI1MWI3YjYi
CisKK1tbcGFja2FnZV1dCituYW1lID0gIndpbmFwaS11dGlsIgordmVyc2lvbiA9ICIwLjEuNSIK
K3NvdXJjZSA9ICJyZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5p
by1pbmRleCIKK2NoZWNrc3VtID0gIjcwZWM2Y2U4NWJiMTU4MTUxY2FlNWU1Yzg3Zjk1YThlOTdk
MmMwYzRiMDAxMjIzZjMzYTMzNGUzY2U1ZGUxNzgiCitkZXBlbmRlbmNpZXMgPSBbCisgIndpbmFw
aSIsCitdCisKK1tbcGFja2FnZV1dCituYW1lID0gIndpbmFwaS14ODZfNjQtcGMtd2luZG93cy1n
bnUiCit2ZXJzaW9uID0gIjAuNC4wIgorc291cmNlID0gInJlZ2lzdHJ5K2h0dHBzOi8vZ2l0aHVi
LmNvbS9ydXN0LWxhbmcvY3JhdGVzLmlvLWluZGV4IgorY2hlY2tzdW0gPSAiNzEyZTIyNzg0MWQw
NTdjMWVlMWNkMmZiMjJmYTdlNWE1NDYxYWU4ZTQ4ZmEyY2E3OWVjNDJjZmMxOTMxMTgzZiIKKwor
W1twYWNrYWdlXV0KK25hbWUgPSAid3l6IgordmVyc2lvbiA9ICIwLjIuMCIKK3NvdXJjZSA9ICJy
ZWdpc3RyeStodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NyYXRlcy5pby1pbmRleCIKK2No
ZWNrc3VtID0gIjg1ZTYwYjBkMWI1Zjk5ZGIyNTU2OTM0ZTIxOTM3MDIwNzc2YTVkMzE1MjBiZjE2
OWU4NTFhYzQ0ZTY0MjAyMTQiCmRpZmYgLS1naXQgYS9iaW5kaW5ncy9ydXN0L0NhcmdvLnRvbWwg
Yi9iaW5kaW5ncy9ydXN0L0NhcmdvLnRvbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMC4uMDE1NTFjZgotLS0gL2Rldi9udWxsCisrKyBiL2JpbmRpbmdzL3J1c3QvQ2FyZ28udG9t
bApAQCAtMCwwICsxLDIgQEAKK1t3b3Jrc3BhY2VdCittZW1iZXJzID0gWyAibGliZ3Bpb2Qtc3lz
IiBdCmRpZmYgLS1naXQgYS9iaW5kaW5ncy9ydXN0L2xpYmdwaW9kLXN5cy9DYXJnby50b21sIGIv
YmluZGluZ3MvcnVzdC9saWJncGlvZC1zeXMvQ2FyZ28udG9tbApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwLi42Yzc2ZjA4Ci0tLSAvZGV2L251bGwKKysrIGIvYmluZGluZ3MvcnVz
dC9saWJncGlvZC1zeXMvQ2FyZ28udG9tbApAQCAtMCwwICsxLDE0IEBACitbcGFja2FnZV0KK25h
bWUgPSAibGliZ3Bpb2Qtc3lzIgordmVyc2lvbiA9ICIwLjEuMCIKK2VkaXRpb24gPSAiMjAyMSIK
K2xpbmtzID0gImdwaW9kIgorcmVwb3NpdG9yeSA9ICJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGlicy9saWJncGlvZC9saWJncGlvZC5naXQiCisKK1tmZWF0dXJlc10KK2RlZmF1bHQg
PSBbICJwa2ctY29uZmlnIiBdCitnZW5lcmF0ZSA9IFsgImJpbmRnZW4iIF0KKworW2J1aWxkLWRl
cGVuZGVuY2llc10KK2JpbmRnZW4gPSB7IHZlcnNpb24gPSAiMC41OS4xIiwgb3B0aW9uYWwgPSB0
cnVlIH0KK3BrZy1jb25maWcgPSB7IHZlcnNpb24gPSAiMC4zLjIyIiwgb3B0aW9uYWwgPSB0cnVl
IH0KZGlmZiAtLWdpdCBhL2JpbmRpbmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL1JFQURNRS5tZCBiL2Jp
bmRpbmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL1JFQURNRS5tZApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwLi41OTRkYmY0Ci0tLSAvZGV2L251bGwKKysrIGIvYmluZGluZ3MvcnVzdC9s
aWJncGlvZC1zeXMvUkVBRE1FLm1kCkBAIC0wLDAgKzEsNyBAQAorIyBHZW5lcmF0ZWQgbGliZ3Bp
b2QgUnVzdCBGRkkgYmluZGluZ3MKK0F1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIFJ1c3QgRkZJIGJp
bmRpbmdzIHZpYSBbYmluZGdlbl0oaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0LWJp
bmRnZW4pLgorCisjIyBVcGRhdGluZyBiaW5kaW5ncworMS4gQ2xvbmUgdGhlIHNvdXJjZSBmcm9t
IDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlicy9saWJncGlvZC9saWJncGlvZC5n
aXQvPgorMi4gcnVuIGBjYXJnbyBidWlsZCAtLWZlYXR1cmVzIGdlbmVyYXRlYCBmcm9tIGAuL2Jp
bmRpbmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL2AKKzMuIENvbW1pdCBjaGFuZ2VzIGluIGAuL2JpbmRp
bmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL3NyYy9saWIucnNgCmRpZmYgLS1naXQgYS9iaW5kaW5ncy9y
dXN0L2xpYmdwaW9kLXN5cy9idWlsZC5ycyBiL2JpbmRpbmdzL3J1c3QvbGliZ3Bpb2Qtc3lzL2J1
aWxkLnJzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmNkNzFmYzgKLS0tIC9k
ZXYvbnVsbAorKysgYi9iaW5kaW5ncy9ydXN0L2xpYmdwaW9kLXN5cy9idWlsZC5ycwpAQCAtMCww
ICsxLDE2NiBAQAordXNlIHN0ZDo6eworICAgIGVycm9yOjpFcnJvciwKKyAgICBwYXRoOjp7UGF0
aCwgUGF0aEJ1Zn0sCit9OworCitmbiBleHBlY3RfZW52X3ZhcihrZXk6ICZzdHIpIC0+IFN0cmlu
ZyB7CisgICAgc3RkOjplbnY6OnZhcihrZXkpCisgICAgICAgIC51bndyYXBfb3JfZWxzZSh8ZXJy
fCBwYW5pYyEoIkNvdWxkIG5vdCBmaW5kIGVudmlyb25tZW50IHZhcmlhYmxlICd7fSc6IHt9Iiwg
a2V5LCBlcnIpKQorfQorCitmbiBjb3B5X2ZpbGVzX2luX2RpcihkaXJlY3Rvcnk6IHN0ZDo6ZnM6
OlJlYWREaXIsIGZpbGVfbmFtZV9jb250YWluczogJnN0ciwgZGVzdGluYXRpb246ICZQYXRoKSB7
CisgICAgaWYgZGVzdGluYXRpb24uZXhpc3RzKCkgJiYgZGVzdGluYXRpb24uaXNfZGlyKCkgewor
ICAgICAgICBkaXJlY3RvcnkKKyAgICAgICAgICAgIC5maWx0ZXJfbWFwKHxlbnRyeXwgeworICAg
ICAgICAgICAgICAgIGlmIGxldCBPayhlbnRyeSkgPSBlbnRyeSB7CisgICAgICAgICAgICAgICAg
ICAgIGxldCBwYXRoID0gZW50cnkucGF0aCgpOworICAgICAgICAgICAgICAgICAgICBwYXRoLmlz
X2ZpbGUoKS50aGVuKHx8IHBhdGgpCisgICAgICAgICAgICAgICAgfSBlbHNlIHsKKyAgICAgICAg
ICAgICAgICAgICAgTm9uZQorICAgICAgICAgICAgICAgIH0KKyAgICAgICAgICAgIH0pCisgICAg
ICAgICAgICAuZm9yX2VhY2gofGZpbGVfcGF0aHwgeworICAgICAgICAgICAgICAgIGlmIGxldCBT
b21lKGZpbGVfbmFtZSkgPQorICAgICAgICAgICAgICAgICAgICBmaWxlX3BhdGguZmlsZV9uYW1l
KCkubWFwKHN0ZDo6ZmZpOjpPc1N0cjo6dG9fc3RyKS5mbGF0dGVuKCkKKyAgICAgICAgICAgICAg
ICB7CisgICAgICAgICAgICAgICAgICAgIGlmIGZpbGVfbmFtZS5jb250YWlucyhmaWxlX25hbWVf
Y29udGFpbnMpIHsKKyAgICAgICAgICAgICAgICAgICAgICAgIGlmIGxldCBFcnIoZXJyKSA9IHN0
ZDo6ZnM6OmNvcHkoJmZpbGVfcGF0aCwgJmRlc3RpbmF0aW9uLmpvaW4oZmlsZV9uYW1lKSkgewor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50bG4hKAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiY2FyZ286d2FybmluZz1Db3VsZCBub3QgY29weSB7fSB0byB7fToge30i
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlX3BhdGguZGlzcGxheSgpLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXN0aW5hdGlvbi5kaXNwbGF5KCksCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVycgorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICk7CisgICAgICAgICAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgICAg
IH0KKyAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICB9KTsKKyAgICB9IGVsc2UgeworICAg
ICAgICBwcmludGxuISgKKyAgICAgICAgICAgICJjYXJnbzp3YXJuaW5nPWRlc3RpbmF0aW9uIGRp
cmVjdG9yeSBub3QgZm91bmQ6IHt9IiwKKyAgICAgICAgICAgIGRlc3RpbmF0aW9uLmRpc3BsYXko
KQorICAgICAgICApOworICAgIH0KK30KKworI1tjZmcoZmVhdHVyZSA9ICJwa2ctY29uZmlnIild
CitmbiBsaW5rX3dpdGhfcGtnX2NvbmZpZ19saWJyYXJ5KGxpbmtfbmFtZTogJnN0ciwgaW50ZXJm
YWNlOiAmUGF0aCkgLT4gUmVzdWx0PFBhdGhCdWYsIFN0cmluZz4geworICAgIGxldCBsaWJyYXJ5
X25hbWUgPSBmb3JtYXQhKCJsaWJ7fSIsIGxpbmtfbmFtZSk7CisgICAgbGV0IGxpYnJhcnkgPSBw
a2dfY29uZmlnOjpwcm9iZV9saWJyYXJ5KCZsaWJyYXJ5X25hbWUpCisgICAgICAgIC5tYXBfZXJy
KHxlcnJ8IGZvcm1hdCEoIkNvdWxkIG5vdCBmaW5kIHt9OiB7fSIsIGxpYnJhcnlfbmFtZSwgZXJy
KSk/OworICAgIGxpYnJhcnkKKyAgICAgICAgLmluY2x1ZGVfcGF0aHMKKyAgICAgICAgLml0ZXIo
KQorICAgICAgICAubWFwKHxpbmNsdWRlX3BhdGh8IGluY2x1ZGVfcGF0aC5qb2luKGludGVyZmFj
ZSkpCisgICAgICAgIC5mb2xkKE5vbmUsIHxjdXJyZW50LCBoZWFkZXJfcGF0aHwgeworICAgICAg
ICAgICAgaWYgY3VycmVudC5pc19ub25lKCkgJiYgaGVhZGVyX3BhdGguZXhpc3RzKCkgeworICAg
ICAgICAgICAgICAgIFNvbWUoaGVhZGVyX3BhdGgpCisgICAgICAgICAgICB9IGVsc2UgeworICAg
ICAgICAgICAgICAgIGN1cnJlbnQKKyAgICAgICAgICAgIH0KKyAgICAgICAgfSkKKyAgICAgICAg
Lm9rX29yX2Vsc2UofHwgeworICAgICAgICAgICAgZm9ybWF0ISgKKyAgICAgICAgICAgICAgICAi
Q291bGQgbm90IGZpbmQge30gaW4gYW55IG9mIHs6P30sIHByb3ZpZGVkIGJ5IHBrZy1jb25maWci
LAorICAgICAgICAgICAgICAgIGludGVyZmFjZS5kaXNwbGF5KCksCisgICAgICAgICAgICAgICAg
bGlicmFyeS5pbmNsdWRlX3BhdGhzCisgICAgICAgICAgICApCisgICAgICAgIH0pCisgICAgICAg
IC5tYXBfZXJyKEludG86OmludG8pCit9CisKKyNbY2ZnKGZlYXR1cmUgPSAiZ2VuZXJhdGUiKV0K
K2ZuIGdlbmVyYXRlX2JpbmRpbmdzKGhlYWRlcl9maWxlOiAmUGF0aCwgb3V0X2ZpbGU6ICZQYXRo
KSB7CisgICAgY29uc3QgU1lNQk9MX1BSRUZJWF9SRUdFWDogJnN0ciA9ICIoP2kpZ3Bpb2RfLioi
OworCisgICAgbGV0IG11dCBvdXRwdXQgPSBiaW5kZ2VuOjpidWlsZGVyKCkKKyAgICAgICAgLmhl
YWRlcihoZWFkZXJfZmlsZS5kaXNwbGF5KCkudG9fc3RyaW5nKCkpCisgICAgICAgIC5hbGxvd2xp
c3RfZnVuY3Rpb24oU1lNQk9MX1BSRUZJWF9SRUdFWCkKKyAgICAgICAgLmFsbG93bGlzdF90eXBl
KFNZTUJPTF9QUkVGSVhfUkVHRVgpCisgICAgICAgIC5hbGxvd2xpc3RfdmFyKFNZTUJPTF9QUkVG
SVhfUkVHRVgpCisgICAgICAgIC5nZW5lcmF0ZV9jb21tZW50cyhmYWxzZSkKKyAgICAgICAgLmdl
bmVyYXRlKCkKKyAgICAgICAgLmV4cGVjdCgiQ291bGQgbm90IGdlbmVyYXRlIGJpbmRpbmdzIikK
KyAgICAgICAgLnRvX3N0cmluZygpOworCisgICAgLy8gYWRkIHNvbWUgbmljZXRpZXMgYWZ0ZXIg
dGhlIGF1dG9nZW5lcmF0ZWQgY29tbWVudAorICAgIG91dHB1dC5pbnNlcnRfc3RyKAorICAgICAg
ICBvdXRwdXQuZmluZCgnXG4nKS5leHBlY3QoIk5vdGhpbmcgd2FzIGdlbmVyYXRlZCIpICsgMSwK
KyAgICAgICAgY29uY2F0ISgKKyAgICAgICAgICAgICJcbiIsCisgICAgICAgICAgICAiIyFbYWxs
b3coZGVyZWZfbnVsbHB0cildXG4iLAorICAgICAgICAgICAgIiMhW2FsbG93KG5vbl9jYW1lbF9j
YXNlX3R5cGVzKV1cbiIsCisgICAgICAgICAgICAiIyFbYWxsb3cobm9uX3NuYWtlX2Nhc2UpXVxu
IiwKKyAgICAgICAgICAgICIjIVthbGxvdyhub25fdXBwZXJfY2FzZV9nbG9iYWxzKV1cbiIsCisg
ICAgICAgICAgICAiIyFbZG9jID0gaW5jbHVkZV9zdHIhKFwiLi4vUkVBRE1FLm1kXCIpXVxuIgor
ICAgICAgICApLAorICAgICk7CisKKyAgICBvdXRwdXQucHVzaF9zdHIoY29uY2F0ISgKKyAgICAg
ICAgIlxuIiwKKyAgICAgICAgIiNbY2ZnKHRlc3QpXVxuIiwKKyAgICAgICAgIm1vZCB0ZXN0cyB7
XG4iLAorICAgICAgICAiICAgIHVzZSBzdXBlcjo6KjtcbiIsCisgICAgICAgICJcbiIsCisgICAg
ICAgICIgICAgI1t0ZXN0XVxuIiwKKyAgICAgICAgIiAgICBmbiBsaW5rX2NoZWNrKCkge1xuIiwK
KyAgICAgICAgIiAgICAgICAgdXNlIHN0ZDo6ZmZpOjpDU3RyO1xuIiwKKyAgICAgICAgIlxuIiwK
KyAgICAgICAgIiAgICAgICAgYXNzZXJ0ISghdW5zYWZlIHsgQ1N0cjo6ZnJvbV9wdHIoZ3Bpb2Rf
dmVyc2lvbl9zdHJpbmcoKSkgfVxuIiwKKyAgICAgICAgIiAgICAgICAgICAgIC50b19zdHJpbmdf
bG9zc3koKVxuIiwKKyAgICAgICAgIiAgICAgICAgICAgIC5pc19lbXB0eSgpKTtcbiIsCisgICAg
ICAgICIgICAgfVxuIiwKKyAgICAgICAgIn1cbiIKKyAgICApKTsKKworICAgIHN0ZDo6ZnM6Ondy
aXRlKG91dF9maWxlLCAmKm91dHB1dCkKKyAgICAgICAgLnVud3JhcF9vcl9lbHNlKHxlcnJ8IHBh
bmljISgiQ291bGQgbm90IHdyaXRlIHRvIHt9OiB7fSIsIG91dF9maWxlLmRpc3BsYXkoKSwgZXJy
KSk7Cit9CisKK2ZuIG1haW4oKSB7CisgICAgbGV0IGhlYWRlcl9maWxlX25hbWUgPSBQYXRoOjpu
ZXcoImdwaW9kLmgiKTsKKyAgICBsZXQgb3V0X2RpciA9IFBhdGhCdWY6OmZyb20oZXhwZWN0X2Vu
dl92YXIoIk9VVF9ESVIiKSk7CisgICAgbGV0IGxpYnJhcnkgPSBleHBlY3RfZW52X3ZhcigiQ0FS
R09fTUFOSUZFU1RfTElOS1MiKTsKKworICAgIGxldCByZWxfc291cmNlX2Rpcl9yb290ID0gUGF0
aDo6bmV3KCIuLi8uLi8uLi8iKTsKKyAgICBsZXQgaGVhZGVyX3BhdGggPSByZWxfc291cmNlX2Rp
cl9yb290LmpvaW4oImluY2x1ZGUiKS5qb2luKGhlYWRlcl9maWxlX25hbWUpOworICAgIGxldCBs
aWJyYXJ5X3BhdGggPSByZWxfc291cmNlX2Rpcl9yb290LmpvaW4oImxpYiIpLmpvaW4oIi5saWJz
Iik7CisKKyAgICAjW2FsbG93KHVudXNlZF9tdXQpXQorICAgIGxldCBtdXQgaGVhZGVyX3BhdGg6
IFJlc3VsdDxQYXRoQnVmLCBCb3g8ZHluIEVycm9yPj4gPSBpZiBoZWFkZXJfcGF0aC5leGlzdHMo
KSB7CisgICAgICAgIHByaW50bG4hKCJjYXJnbzpyZXJ1bi1pZi1jaGFuZ2VkPXt9IiwgaGVhZGVy
X3BhdGguZGlzcGxheSgpKTsKKyAgICAgICAgcHJpbnRsbiEoImNhcmdvOnJlcnVuLWlmLWNoYW5n
ZWQ9e30iLCBsaWJyYXJ5X3BhdGguZGlzcGxheSgpKTsKKyAgICAgICAgcHJpbnRsbiEoImNhcmdv
OnJ1c3RjLWxpbmstbGliPXt9IiwgbGlicmFyeSk7CisKKyAgICAgICAgaWYgbGV0IE9rKGRpcl9p
dGVyKSA9IGxpYnJhcnlfcGF0aC5yZWFkX2RpcigpIHsKKyAgICAgICAgICAgIHByaW50bG4hKCJj
YXJnbzpydXN0Yy1saW5rLXNlYXJjaD17fSIsIG91dF9kaXIuZGlzcGxheSgpKTsKKyAgICAgICAg
ICAgIGNvcHlfZmlsZXNfaW5fZGlyKGRpcl9pdGVyLCAiLnNvIiwgJm91dF9kaXIpOworICAgICAg
ICB9IGVsc2UgeworICAgICAgICAgICAgcHJpbnRsbiEoCisgICAgICAgICAgICAgICAgImNhcmdv
Ondhcm5pbmc9Q291bGQgbm90IGZpbmQgbGlicmFyeSBidWlsdCBpbiB7fS4gTGlua2luZyBtYXkg
ZmFpbC4iLAorICAgICAgICAgICAgICAgIGxpYnJhcnlfcGF0aC5kaXNwbGF5KCkKKyAgICAgICAg
ICAgICk7CisgICAgICAgIH0KKworICAgICAgICBPayhoZWFkZXJfcGF0aCkKKyAgICB9IGVsc2Ug
eworICAgICAgICBFcnIoIkNvdWxkIG5vdCBmaW5kIHNvdXJjZSBkaXJlY3RvcnkiLmludG8oKSkK
KyAgICB9OworCisgICAgI1tjZmcoZmVhdHVyZSA9ICJwa2ctY29uZmlnIildCisgICAgaWYgaGVh
ZGVyX3BhdGguaXNfZXJyKCkgeworICAgICAgICBoZWFkZXJfcGF0aCA9IGxpbmtfd2l0aF9wa2df
Y29uZmlnX2xpYnJhcnkoJmxpYnJhcnksIGhlYWRlcl9maWxlX25hbWUpLm1hcF9lcnIoSW50bzo6
aW50byk7CisgICAgfQorCisgICAgI1tjZmcoZmVhdHVyZSA9ICJnZW5lcmF0ZSIpXQorICAgIGdl
bmVyYXRlX2JpbmRpbmdzKAorICAgICAgICBoZWFkZXJfcGF0aAorICAgICAgICAgICAgLmFzX3Jl
ZigpCisgICAgICAgICAgICAudW53cmFwX29yX2Vsc2UofGVycnwgcGFuaWMhKCJDb3VsZCBub3Qg
ZmluZCB7fToge30iLCBoZWFkZXJfZmlsZV9uYW1lLmRpc3BsYXkoKSwgZXJyKSksCisgICAgICAg
IFBhdGg6Om5ldygiLi9zcmMvbGliLnJzIiksCisgICAgKTsKKworICAgIGlmIGxldCBFcnIoZXJy
KSA9IGhlYWRlcl9wYXRoIHsKKyAgICAgICAgcGFuaWMhKCJDb3VsZCBub3QgZmluZCBsaWJ7fTog
e30iLCBsaWJyYXJ5LCBlcnIpOworICAgIH0KK30KLS0gCjIuMzQuMQoK
--000000000000c8ef4305d33f994b--
